import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mobilecurling/core/classes/game_state/game_state.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:mobilecurling/game.dart';

final List<({GameState state, Game? game})> games = [];
final List<({String channelID, String lobbyID, WebSocketChannel channel})> channels = [];

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  //gameLoop();
  return serve(handler, ip, port);
}
