import 'dart:math';
import 'package:mobilecurling/core/classes/user/user.dart';
import 'package:uuid/uuid.dart';

/// Curling stone object
class Stone {
  /// Constructor
  Stone({required this.x, required this.y, required this.user})
      : id = Uuid().v4();

  final String? id;
  double? x;
  double? y;
  User? user;
  static const double radius = 14.53;
  static const double mass = 19.96;
  double angle = 0.0;
  double speed = 0.0;

  /// helper function to check if colliding with another stone
  bool isCollidingWith(Stone otherStone) {
    double distanceSquared = (x! - otherStone.x!) * (x! - otherStone.x!) +
        (y! - otherStone.y!) * (y! - otherStone.y!);
    double minDistanceSquared = (2 * radius) * (2 * radius);
    return distanceSquared < minDistanceSquared;
  }

  void slide(double angle, double speed) {
    this.angle = angle;
    this.speed = speed;
  }

  void update(double deltaTime) {
    // Laske X- ja Y-suuntaiset nopeudet kulman ja alkunopeuden perusteella
    // Lasketaan vain jarrutusta.
    // Kulmien nopeuksien jälkeen laske kitkan vaikutus X- ja Y-nopeuksiin ajan
    // funktiona.
    double radians = angle * (pi / 180);

    // Nopeus x-suunnassa
    double speedX = speed * cos(radians);
    // Nopeus y-suunnassa
    double speedY = speed * sin(radians);

    // Drags. FIXME
    double dragX = 0.5 * 0.02 * pow(speedX, 2) / mass;
    double dragY = 0.5 * 0.02 * pow(speedY, 2) / mass;

    // Speed reductions based on drag and mass
    speedX -= dragX;
    speedY -= dragY;

    if (speedX.abs() < 0.01) {
      speedX = 0.0;
    }

    if (speedY.abs() < 0.01) {
      speedY = 0.0;
    }

    // TODO: Laske uusien koordinaattien pysyminen koordinaatistossa
    // - laske tähän kimpoaminen reunoista ja
    // - laske kimpoaminen muista kiekoista
    // if (x! + speedX)

    // new positions of coordinates
    x = x! + speedX;
    y = y! + speedY;
  }
}
