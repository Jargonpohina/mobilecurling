import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:mobilecurling/core/classes/game_state/game_state.dart';
import 'package:mobilecurling/core/classes/message/message.dart';
import 'package:mobilecurling/game.dart';

import '../../main.dart';

/// Function that gets the index of the game state based on the ID of the lobby.
int gameIndex(String lobbyID) {
  final index = games.indexWhere((element) => element.lobby != null ? element.lobby!.id == lobbyID : false);
  return index;
}

/// The loop that runs periodically to send messages to everyone in this websocket.
/// This is where you want to start converting the calculated game data into a game state
/// when both players have joined the game.
void gameLoop({required String lobbyID, required WebSocketChannel channel}) {
  Future.delayed(Duration(milliseconds: 10), () {
    // It's a RECURSION! God bless America.
    gameLoop(lobbyID: lobbyID, channel: channel);
    // Let's send the game state to clients.
    final index = gameIndex(lobbyID);
    if (index != -1) {
      // If both players have joined the game, let's start it.
      final Game game = Game(playerOne: games[index].playerOne!, playerTwo: games[index].playerTwo!);
      print(game); // tää on iha vaa demo
      /// Lets send the game state with freezed as json that has been converted to a string back
      /// to clients.
      channel.sink.add(jsonEncode(games[index].toJson()));
    }
  });
}

Future<Response> onRequest(RequestContext context, String id) async {
  final handler = webSocketHandler((channel, protocol) {
    // Here we want to receive the stones that are being thrown.
    channel.stream.listen((message) {
      // We convert the message from json string to an actual message
      final map = jsonDecode(message as String) as Map<String, Object?>;
      // Now we have the message as a Dart map. Let's convert it into a message class with Freezed.
      final messageObj = Message.fromJson(map);
      // Okey dokey. Now let's have a switch case based on the type of the message.
      switch (messageObj.type) {
        // If the message is of type player joining.
        case MessageType.join:
          {
            // Let's see if the game already exists in the datastructure.
            final index = gameIndex(id);
            // -1 means that the index wasn't found.
            if (index != -1) {
              // If the game already exists, there is also player one. Let's add the player two.
              games[index] = games[index].copyWith(playerTwo: messageObj.user);
            } else {
              // The game doesn't exist, so this is the first player creating it. Let's add the game state.
              games.add(GameState(playerOne: messageObj.user));
              // Let's kickstart the game loop itself now that the game state has been created.
              gameLoop(lobbyID: id, channel: channel);
            }
          }
        case MessageType.slide:
        // TODO: Handle this case.
      }
    });
  });
  return handler(context);
}
