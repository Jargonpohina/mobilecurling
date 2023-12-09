import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mobilecurling/core/classes/game_state/game_state.dart';

final List<GameState> games = [];

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  return serve(handler, ip, port);
}
