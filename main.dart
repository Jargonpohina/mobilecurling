import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mobilecurling/core/classes/game_state/game_state.dart';
import 'package:mobilecurling/game.dart';

final List<GameState> games = [];

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  final game = Game();
  // tää on ihan demo vaan
  Timer(const Duration(seconds: 5), game.stop);
  return serve(handler, ip, port);
}
