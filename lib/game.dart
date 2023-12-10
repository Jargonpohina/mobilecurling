import 'dart:async';
import 'package:mobilecurling/components/stone.dart';
import 'package:mobilecurling/core/shared_classes/user/user.dart';

/// Game tick logic implementation
class Game {
  /// List for the stones in the game
  List<Stone> stones = [];
  // List for the users in the game
  List<User> users = []; // nämä pitää repiä lobbyltä

  /// Creating the game instance
  Game({required User playerOne, required User playerTwo}) {
    initUsers(playerOne: playerOne, playerTwo: playerTwo);
    initStones();

    // start the tick system
    _timer = Timer.periodic(Duration(milliseconds: frameDuration.toInt()), _update);
  }

  // Tick system for the game:
  /// fps of the game
  static const double desiredFps = 60;
  static const double frameDuration = 1000 / desiredFps;

  late Timer _timer;
  DateTime _lastFrameTime = DateTime.now();

  void _update(Timer timer) {
    final DateTime currentTime = DateTime.now();
    final double deltaTime = currentTime.difference(_lastFrameTime).inMilliseconds / 1000.0;

    update(deltaTime);

    _lastFrameTime = currentTime;
  }

  void initUsers({required User playerOne, required User playerTwo}) {
    users.addAll([playerOne, playerTwo]);
  }

  void initStones() {
    for (User user in users) {
      for (int i = 0; i < 4; i++) {
        stones.add(Stone(user: user));
      }
    }
  }

  /// Updates the game based on ticks
  void update(double deltaTime) {
    for (final stone in stones) {
      stone.update(deltaTime);
    }
  }

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
      playerOne: User(username: 'test', password: 'test'),
      playerTwo: User(username: 'test1', password: 'test2'));

  final kivi = test.stones.first.slide(30, 180);
}
*/
