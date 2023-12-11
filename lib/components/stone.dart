import 'dart:math';
import 'package:mobilecurling/components/sheet.dart';
import 'package:mobilecurling/core/shared_classes/user/user.dart';
import 'package:uuid/uuid.dart';

/// Curling stone object
class Stone {
  /// Constructor
  // For debugging purposes use the following format:
  //Stone({required this.user, required this.x, required this.y})
  //    : id = Uuid().v4();
  Stone({required this.user}) : id = const Uuid().v4();
  Sheet sheet = Sheet();
  User? user;
  final String? id;
  // actually 14.53cm, but client scales to 64x64 sprite
  static const double radius = 32;
  static const double mass = 19.96;
  double x = 548.64;
  double y = 250;
  // double? x; // original: 548.64
  // double? y; // original: 250
  double angle = 0.0;
  double speed = 0.0;
  double speedX = 0.0;
  double speedY = 0.0;
  bool started = false;

  /// helper function to check if stone will collide during the next timestamp
  bool isGoingToCollideWithStone(Stone otherStone, double deltaTime) {
    double futureX = x! + speedX * deltaTime;
    double futureY = y! + speedY * deltaTime;

    // onkohan tässä yksiköt ihan ok hmm
    // nopeuden komponentit on mallia cm/s? ja deltaTime on [milliseconds/1000]
    double otherFutureX = otherStone.x! + otherStone.speedX * deltaTime;
    double otherFutureY = otherStone.y! + otherStone.speedY * deltaTime;

    double distance =
        sqrt(pow(futureX - otherFutureX, 2) + pow(futureY - otherFutureY, 2));

    // print('distance in the next timestamp: $distance');

    return distance < 2 * radius; // radius + otherStone.radius
  }

  /// phys function to handle collisions between stones
  void handleStoneCollision(Stone otherStone) {
    //print('Calculating collision from $id');
    //print('Current stone: $x, $y');
    //print('Other stone: ${otherStone.x}, ${otherStone.y}');

    /// difference between stones' x-coords
    final dx = otherStone.x! - x!;

    /// difference between stones' y-coords
    final dy = otherStone.y! - y!;

    /// collision angle based on coord differences
    final collAngle = atan2(dy, dx);

    final thisSpeed = sqrt(pow(speedX, 2) + pow(speedY, 2));
    final otherSpeed =
        sqrt(pow(otherStone.speedX, 2) + pow(otherStone.speedY, 2));

    final thisDirection = atan2(speedY, speedX);
    final otherDirection = atan2(otherStone.speedY, otherStone.speedX);

    // speeds after collision as they have same masses
    final thisNewSpeed = otherSpeed;
    final otherNewSpeed = thisSpeed;

    speedX = thisNewSpeed * cos(thisDirection - collAngle);
    speedY = thisNewSpeed * sin(thisDirection - collAngle);

    otherStone.speedX = otherNewSpeed * cos(otherDirection - collAngle);
    otherStone.speedY = otherNewSpeed * sin(otherDirection - collAngle);
  }

  /// checks if the stone is within boundaries and fixes pos & vel if needed
  void checkBoundaries() {
    // print('Checking $id boundaries: $x $y');
    if (x! - radius < sheet.left) {
      x = radius;
      speedX = -speedX;
    }
    if (x! + radius > sheet.right) {
      x = sheet.right - radius;
      speedX = -speedX;
    }
    if (y! - radius < sheet.top) {
      y = radius;
      speedY = -speedY;
    }
    if (y! + radius > sheet.bottom) {
      y = sheet.bottom - radius;
      speedY = -speedY;
    }
  }

  /// initialize the current stone
  void slide(double angle, double speed) {
    this.angle = angle;
    this.speed = speed;
    double radians = angle * (pi / 180);
    if (!started) {
      started = true;
      speedX = speed * cos(radians);
      speedY = speed * sin(radians);
    }
  }

  /// low-quality phys engine by tikibeni (SheetPhysX)
  void update(double deltaTime, List<Stone> activeStones) {
    // Problems:
    // - collision almost always results in both zero velocities
    // - sometimes collision throws the stone in totally random direction
    double dragX;
    double dragY;

    if (speedX.abs() > 0) {
      dragX = 0.5 * sheet.dynamicFriction * pow(speedX, 2) / mass;
      if (dragX < 0.1) dragX = 0.1; // workaround to make the simulation end
      if (speedX < 0) {
        speedX += dragX;
      } else {
        speedX -= dragX;
      }
    }

    if (speedY.abs() > 0) {
      dragY = 0.5 * sheet.dynamicFriction * pow(speedY, 2) / mass;
      if (dragY < 0.1) dragY = 0.1; // workaround to make the simulation end
      if (speedY < 0) {
        speedY += dragY;
      } else {
        speedY -= dragY;
      }
    }

    if (speedX.abs() < 0.05) {
      speedX = 0.0;
    }

    if (speedY.abs() < 0.05) {
      speedY = 0.0;
    }

    if (speedX > 0.0 || speedY > 0.0) {
      checkBoundaries();
      for (final otherStone in activeStones) {
        if (otherStone != this &&
            isGoingToCollideWithStone(otherStone, deltaTime)) {
          handleStoneCollision(otherStone);
        }
      }
    } else {
      speed = 0.0; // do NOT remove this.
    }
    x = x! + speedX;
    y = y! + speedY;
  }
}
