import 'dart:async';
// import 'dart:io';
import 'package:mobilecurling/components/stone.dart';
import 'package:mobilecurling/core/shared_classes/user/user.dart';

/// Game tick logic implementation
class Game {
  /// List for the stones in the game
  List<Stone> stones = [];

  /// List for the active stones in the game
  List<Stone> activeStones = [];

  /// List for the users in the game
  List<User> users = []; // nämä pitää repiä lobbyltä

  /// Creating the game instance
  Game({required User playerOne, required User playerTwo}) {
    initUsers(playerOne: playerOne, playerTwo: playerTwo);
    initStones();

    // start the tick system
    _timer =
        Timer.periodic(Duration(milliseconds: frameDuration.toInt()), _update);
  }

  // Tick system for the game:
  /// fps of the game
  static const double desiredFps = 60;
  static const double frameDuration = 1000 / desiredFps;

  late Timer _timer;
  DateTime _lastFrameTime = DateTime.now();

  void _update(Timer timer) {
    final DateTime currentTime = DateTime.now();
    final double deltaTime =
        currentTime.difference(_lastFrameTime).inMilliseconds / 1000.0;

    update(deltaTime);

    _lastFrameTime = currentTime;
  }

  /// initialize game with two users
  void initUsers({required User playerOne, required User playerTwo}) {
    users.addAll([playerOne, playerTwo]);
  }

  /// initialize both players with four stones
  void initStones() {
    for (User user in users) {
      for (int i = 0; i < 4; i++) {
        // for debugging: stones.add(Stone(user: user, x: 548.64, y: 250));
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
      if (stone.speed > 0) {
        return true;
      }
    }
    return false;
  }

  /// Stops the gameloop
  void stop() {
    _timer.cancel();
  }
}

// Debugger:
/*
void main() {
  final test = Game(
    playerOne: const User(username: 'test', password: 'test'),
    playerTwo: const User(username: 'test1', password: 'test2'),
  );

  final estekivi = Stone(user: null, x: 4023.804789965249, y: 250);
  test.activeStones.add(estekivi);

  final kivi = test.stones.first;
  test.activeStones.add(kivi);
  kivi.slide(0, 270);
}
*/