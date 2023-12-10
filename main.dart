import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dio/dio.dart';
import 'package:mobilecurling/core/shared_classes/game_state/game_state.dart';
import 'package:mobilecurling/game.dart';

final List<({GameState state, Game? game})> games = [];

final dio = Dio();
const authServerUrl = 'https://auth-ic4hp354na-ew.a.run.app';
const lobbyServerUrl = 'https://lobby-ic4hp354na-ew.a.run.app';
const gameServerUrl = 'rts-ic4hp354na-ew.a.run.app';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  //gameLoop();
  return serve(handler, ip, port);
}
