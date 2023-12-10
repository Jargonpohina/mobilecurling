import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mobilecurling/core/shared_classes/game_state/game_state.dart';
import 'package:mobilecurling/game.dart';

final List<({GameState state, Game? game})> games = [];

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  //gameLoop();
  return serve(handler, ip, port);
}
