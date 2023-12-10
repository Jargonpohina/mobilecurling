// ignore_for_file: cascade_invocations, lines_longer_than_80_chars, avoid_bool_literals_in_conditional_expressions

import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:mobilecurling/core/shared_classes/game_state/game_state.dart';
import 'package:mobilecurling/core/shared_classes/message/message.dart';
import 'package:mobilecurling/core/shared_classes/stone/stone.dart';
import 'package:mobilecurling/game.dart';

import '../../main.dart';

/// Function that gets the index of the game state based on the ID of the lobby.
int gameIndex(String lobbyID) {
  final index = games.indexWhere((element) => element.state.lobby != null ? element.state.lobby!.id == lobbyID : false);
  return index;
}

/// Reflects the game world into the game state simply by copying the stone data into StoneAPI objects.
GameState reflectGameWorld({required GameState gameState, required Game game}) {
  return gameState.copyWith(
    stones: game.stones.map((e) => StoneAPI(x: e.x, y: e.y, started: e.started, id: e.id!, user: e.user)).toList(),
    canSlide: !game.rollingStones(),
  );
}

void gameLoop({required String lobbyID, required WebSocketChannel channel}) {
  Future.delayed(const Duration(milliseconds: 10), () {
    // It's a RECURSION! God bless America.
    gameLoop(lobbyID: lobbyID, channel: channel);
    // Let's send the game state to clients.
    final index = gameIndex(lobbyID);
    if (index != -1) {
      // If both players have joined the game, let's reflect the Game object's game world to the Game State that turns it into JSON.
      if (games[index].state.playerOne != null && games[index].state.playerTwo != null && games[index].game != null) {
        games[index] = (
          state: reflectGameWorld(gameState: games[index].state, game: games[index].game!),
          game: games[index].game,
        );
      }

      /// Lets send the game state with freezed as json that has been converted to a string back
      /// to clients.
      channel.sink.add(jsonEncode(games[index].state.toJson()));
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
            final index = gameIndex(messageObj.lobby!.id);
            // -1 means that the index wasn't found.
            if (index != -1) {
              // First, update the game state by adding the another player there.
              games[index] = (
                state: games[index].state.copyWith(
                      playerTwo: messageObj.user,
                      playerInTurn: messageObj.user,
                    ),
                game: Game(playerOne: games[index].state.playerOne!, playerTwo: messageObj.user!),
              );
              // Already return the current game state back there
              channel.sink.add(jsonEncode(games[index].state.toJson()));
              gameLoop(lobbyID: messageObj.lobby!.id, channel: channel);
            } else {
              // The game doesn't exist, so this is the first player creating it. Let's add the game state.
              games.add((state: GameState(playerOne: messageObj.user, lobby: messageObj.lobby), game: null));
              // Add the game to the main loop to be messaged every 10 milliseconds.
              gameLoop(lobbyID: messageObj.lobby!.id, channel: channel);
            }
          }
        case MessageType.slide:
          {
            // Let's see if the game already exists in the datastructure.
            final index = gameIndex(messageObj.lobby!.id);
            // -1 means that the index wasn't found.
            if (index != -1) {
              final game = games[index].game;
              final stones = game!.stones;
              // Search a stone from the game that is this user's stone and that is still in the starting position
              final selectedStone = stones.firstWhere((element) => (element.user == messageObj.user) && (element.x == 548.64) && (element.y == 250));
              selectedStone.slide(messageObj.slide!.angle, messageObj.slide!.speed);
              final state = games[index].state;
              games[index] = (
                state: games[index].state.copyWith(
                      playerInTurn: state.playerInTurn == state.playerOne ? state.playerTwo : state.playerOne,
                    ),
                game: game,
              );
            }
          }
      }
    });
  });
  return handler(context);
}
