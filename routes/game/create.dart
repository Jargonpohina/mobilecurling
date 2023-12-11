// ignore_for_file: avoid_dynamic_calls, avoid_slow_async_io, lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mobilecurling/core/shared_classes/game_state/game_state.dart';
import 'package:mobilecurling/core/shared_classes/message/message.dart';

import '../../main.dart';
import '[id].dart';

/// Endpoint for creating a new game
Future<Response> onRequest(RequestContext context) async {
  try {
    final data = await context.request.body();
    final map = jsonDecode(data) as Map<String, Object?>;
    final message = Message.fromJson(map);
    final index = gameIndex(message.lobby!.id);
    if (index == -1) {
      games.add((state: GameState(playerOne: message.user, playerInTurn: message.user, lobby: message.lobby), game: null));
      return Response(body: 'Game created succesfully.');
    }
    return Response(statusCode: HttpStatus.internalServerError, body: 'Game has already been created for this lobby.');
  } catch (e, s) {
    print(e);
    print(s);
    return Response(statusCode: HttpStatus.internalServerError, body: 'Unknown failure.');
  }
}
