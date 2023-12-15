// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:math';
import 'package:mobilecurling/components/sheet.dart';
import 'package:mobilecurling/components/stone.dart';
import 'package:mobilecurling/core/shared_classes/user/user.dart';

/// Game tick logic implementation
class Game {
  /// Creating the game instance
  Game({required User playerOne, required User playerTwo}) {
    initUsers(playerOne: playerOne, playerTwo: playerTwo);
    initStones();
    // start the tick system
    _timer =
        Timer.periodic(Duration(milliseconds: frameDuration.toInt()), _update);
  }

  /// List for the stones in the game
  List<Stone> stones = [];

  /// List for the active stones in the game
  List<Stone> activeStones = [];

  /// List for the users in the game
  List<User> users = [];

  /// Playable area of the game
  Sheet sheet = Sheet();

  /// fps of the game
  static const double desiredFps = 60;

  /// duration of a single frame in milliseconds
  static const double frameDuration = 1000 / desiredFps;

  late Timer _timer;
  DateTime _lastFrameTime = DateTime.now();

  void _update(Timer timer) {
    final currentTime = DateTime.now();
    final deltaTime =
        currentTime.difference(_lastFrameTime).inMilliseconds / 1000.0; // sec

    update(deltaTime);

    _lastFrameTime = currentTime;
  }

  /// initialize game with two users
  void initUsers({required User playerOne, required User playerTwo}) {
    users.addAll([playerOne, playerTwo]);
  }

  /// initialize both players with four stones
  void initStones() {
    for (final user in users) {
      for (var i = 0; i < 4; i++) {
        stones.add(Stone(user: user));
      }
    }
  }

  /// Updates the game based on ticks
  void update(double deltaTime) {
    for (final stone in activeStones) {
      stone.update(deltaTime, activeStones);
    }
  }

  /// helper function to check if game is still running
  bool rollingStones() {
    for (final stone in stones) {
      if (stone.velocity > 0) {
        return true;
      }
    }
    return false;
  }

  /// calculating the winner
  User? winner() {
    final first = users.first;
    final second = users.last;
    double? firstClosest;
    double? secondClosest;

    for (final stone in activeStones) {
      final distance = sqrt(pow(stone.x - sheet.goalAreaCenterWidth, 2) +
          pow(stone.y - sheet.goalAreaCenterHeight, 2));
      if (stone.user == first) {
        if (firstClosest == null) {
          firstClosest = distance;
        } else if (distance < firstClosest) {
          firstClosest = distance;
        }
      } else {
        if (secondClosest == null) {
          secondClosest = distance;
        } else if (distance < secondClosest) {
          secondClosest = distance;
        }
      }
    }

    if (firstClosest != null && secondClosest != null) {
      if (firstClosest < secondClosest) {
        return first;
      }
      if (firstClosest > secondClosest) {
        return second;
      }
    }
    // if it's a tie
    return null;
  }

  /// Stops the gameloop
  void stop() {
    _timer.cancel();
  }
}
