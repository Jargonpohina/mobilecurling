import 'dart:math';
import 'package:mobilecurling/components/sheet.dart';
import 'package:mobilecurling/core/shared_classes/user/user.dart';
import 'package:uuid/uuid.dart';

/// Curling stone object
class Stone {
  /// Constructor
  Stone({required this.user}) : id = Uuid().v4();
  Sheet sheet = Sheet();
  User? user;
  final String? id;
  static const double radius = 14.53;
  static const double mass = 19.96;
  double x = 548.64;
  double y = 250;
  double angle = 0.0;
  double speed = 0.0;
  double speedX = 0.0;
  double speedY = 0.0;
  bool started = false;

  /// helper function to check if colliding with another stone
  bool isCollidingWithStone(Stone otherStone) {
    final distance = sqrt(pow(x - otherStone.x, 2) + pow(y - otherStone.y, 2));
    return distance < 2 * radius; // radius + otherStone.radius
  }

  /// phys function to handle collisions between stones
  void handleStoneCollision(Stone otherStone) {
    // print('Two stones collided!');

    /// difference between stones' x-coords
    final dx = otherStone.x - x;
    //print('diff x: $dx');

    /// difference between stones' y-coords
    final dy = otherStone.y - y;

    //print('diff y: $dy');

    /// collision angle based on coord differences
    final collAngle = atan2(dy, dx);
    //print('Collision angle: $collAngle');

    final thisSpeed = sqrt(pow(speedX, 2) + pow(speedY, 2));
    final otherSpeed =
        sqrt(pow(otherStone.speedX, 2) + pow(otherStone.speedY, 2));

    final thisDirection = atan2(speedY, speedX);
    final otherDirection = atan2(otherStone.speedY, otherStone.speedX);

    // speeds after collision
    final thisSpeed1 = otherSpeed;
    final otherSpeed1 = thisSpeed;

    //print('Speed of the first stone after coll: $thisSpeed1');
    //print('Speed of the second stone after collision: $otherSpeed1');

    //print('Will slide first stone in angle: ${thisDirection - collAngle}');
    //print('Will slide other stone in angle: ${otherDirection - collAngle}');

    slide(thisDirection - collAngle, thisSpeed1);
    otherStone.slide(otherDirection - collAngle, otherSpeed1);
  }

  /// helper function to check if colliding with boundary
  void isCollidingWithBoundary() {
    if (x - radius < sheet.left || x + radius > sheet.right) {
      //print('Is colliding with horizontal boundaries. Changing horiz. vel');
      //print('Old speed: $speedX');
      speedX = -speedX;
      //print('New speed $speedX');
    }

    if (y - radius < sheet.top || y + radius > sheet.bottom) {
      //print('Is colliding with vertical boundaries. Changing vertical vel');
      //print('Old speed: $speedY');
      speedY = -speedY;
      //print('new speed: $speedY');
    }
  }

  /// initialize the current stone
  void slide(double angle, double speed) {
    this.angle = angle;
    this.speed = speed;
    double radians = angle * (pi / 180);
    if (!started) {
      started = true;
      // Nopeus x-suunnassa
      speedX = speed * cos(radians);
      // Nopeus y-suunnassa
      speedY = speed * sin(radians);

      /*
      print('initial speedx $speedX');
      print('intiial speedY $speedY');
      print('initial X coord: $x');
      print('initial Y: $y');
      print('radius: $radius');
      */
    }
  }

  /// phys engine (SheetPhysX)
  void update(double deltaTime, List<Stone> activeStones) {
    double dragX;
    double dragY;

    //print('Hello from $id');

    if (speedX.abs() > 0) {
      dragX = 0.5 * sheet.dynamicFriction * pow(speedX, 2) / mass;
      if (dragX < 0.1) dragX = 0.1; // workaround to make the simulation end
      if (speedX < 0) {
        speedX += dragX;
      } else {
        speedX -= dragX;
      }
      // print("drax: $dragX");
    }

    if (speedY.abs() > 0) {
      dragY = 0.5 * sheet.dynamicFriction * pow(speedY, 2) / mass;
      if (dragY < 0.1) dragY = 0.1; // workaround to make the simulation end
      if (speedY < 0) {
        speedY += dragY;
      } else {
        speedY -= dragY;
      }
      // print("dray: $dragY");
    }

    /*
    if (speedX.abs() > 0) {
      print('SX: $speedX');
    }
    if (speedY.abs() > 0) {
      print('SY: $speedY');
    }
    */

    if (speedX.abs() < 0.05) {
      speedX = 0.0;
    }

    if (speedY.abs() < 0.05) {
      speedY = 0.0;
    }

    if (speedX == 0.0 && speedY == 0.0) {
      speed = 0.0;
    }

    if (speed > 0.0) {
      isCollidingWithBoundary();
      for (final otherStone in activeStones) {
        if (otherStone != this && isCollidingWithStone(otherStone)) {
          handleStoneCollision(otherStone);
        }
      }
    }

    x = x + speedX;
    y = y + speedY;
  }
}
