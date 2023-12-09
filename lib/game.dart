import 'dart:async';

/// Game tick logic implementation
class Game {
  /// Creating the game instance
  Game() {
    // start the tick system
    _timer =
        Timer.periodic(Duration(milliseconds: frameDuration.toInt()), _update);
  }

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

  /// Updates the game based on ticks
  void update(double deltaTime) {
    print("Game logic: $deltaTime");
  }

  /// Stops the gameloop
  void stop() {
    _timer.cancel();
  }
}
