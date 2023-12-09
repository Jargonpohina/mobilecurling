import 'dart:async';
import 'package:mobilecurling/components/stone.dart';

/// Game tick logic implementation
class Game {
  /// List for the stones in the game
  List<Stone> stones = [];
  // List for the users in the game
  List<String> users = []; // nämä pitää repiä lobbyltä

  /// Creating the game instance
  Game() {
    initUsers();
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

  void initUsers() {
    users.add("Sami");
    users.add("Beni");
  }

  void initStones() {
    for (String user in users) {
      for (int i = 0; i < 4; i++) {
        // starting point is 54.864m horizontal and 2.5m vertical
        stones.add(Stone(x: 548.64, y: 250, user: user));
      }
    }
  }

  /// Updates the game based on ticks
  void update(double deltaTime) {
    print("Game logic: $deltaTime");
  }

  /// Stops the gameloop
  void stop() {
    _timer.cancel();
  }
}
