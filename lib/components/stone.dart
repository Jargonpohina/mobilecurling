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
  double velocity = 0.0;
  double velocityX = 0.0;
  double velocityY = 0.0;
  bool started = false;

  /// helper function to check if stone will collide during the next timestamp
  bool isGoingToCollideWithStone(Stone otherStone, double deltaTime) {
    double futureX = x! + velocityX * deltaTime;
    double futureY = y! + velocityY * deltaTime;

    double otherFutureX = otherStone.x! + otherStone.velocityX * deltaTime;
    double otherFutureY = otherStone.y! + otherStone.velocityY * deltaTime;

    double distance =
        sqrt(pow(futureX - otherFutureX, 2) + pow(futureY - otherFutureY, 2));

    return distance < 2 * radius; // radius + otherStone.radius
  }

  /// phys function to handle collisions between stones
  void handleStoneCollision(Stone otherStone) {
    /// difference between stones' x-coords
    final dx = otherStone.x! - x!;

    /// difference between stones' y-coords
    final dy = otherStone.y! - y!;

    /// collision angle based on coord differences
    final collAngle = atan2(dy, dx);

    final thisvelocity = sqrt(pow(velocityX, 2) + pow(velocityY, 2));
    //final othervelocity = sqrt(pow(otherStone.velocityX, 2) + pow(otherStone.velocityY, 2));

    //final thisDirection = atan2(velocityY, velocityX);
    //final otherDirection = atan2(otherStone.velocityY, otherStone.velocityX);
    final otherDirection = atan2(velocityY, velocityX);

    // velocitys after collision as they have same masses
    final thisNewvelocity = 0.0; // this is actually zero
    final otherNewvelocity = thisvelocity;

    //velocityX = thisNewvelocity * cos(thisDirection - collAngle);
    //velocityY = thisNewvelocity * sin(thisDirection - collAngle);
    velocityX = 0.0;
    velocityY = 0.0;

    otherStone.velocityX = otherNewvelocity * cos(otherDirection - collAngle);
    otherStone.velocityY = otherNewvelocity * sin(otherDirection - collAngle);

    // we nudge the collided stone a bit away to avoid collision loop with
    // the initial stone
    otherStone.x = otherStone.x! + otherStone.velocityX;
    otherStone.y = otherStone.y! + otherStone.velocityY;
  }

  /// magic
  void handleStoneCollisionBetter(Stone otherStone) {
    final dx = otherStone.x - x;
    final dy = otherStone.y - y;
    final collAngle = atan2(dy, dx);
    final magnitude = sqrt(pow(velocityX, 2) + pow(velocityY, 2));
    final collVectorX = velocityX / magnitude;
    final collVectorY = velocityY / magnitude;
    final thisNewVelocity = ((velocityX - otherStone.velocityX) * collVectorX +
            (velocityY - otherStone.velocityY) * collVectorY) /
        cos(collAngle);
    final thisNewAngle = (collVectorX * (velocityY - otherStone.velocityY) -
            collVectorY * (velocityX - otherStone.velocityX)) /
        (collVectorX * (velocityX - otherStone.velocityX) +
            collVectorY * (velocityY - otherStone.velocityY));
    final otherNewVelocity = 2 *
            ((velocityX * collVectorX + velocityY * collVectorY) /
                cos(collAngle)) *
            collVectorX +
        ((velocityX * collVectorX + velocityY * collVectorY) / cos(collAngle)) *
            collVectorY -
        magnitude;
    final otherNewAngle = (collVectorX * velocityY - collVectorY * velocityX) /
        (collVectorX * velocityX + collVectorY * velocityY);
    velocityX = thisNewVelocity * cos(thisNewAngle);
    velocityY = thisNewVelocity * sin(thisNewAngle);
    x = x + velocityX;
    y = y + velocityY;
    otherStone.velocityX = otherNewVelocity * cos(otherNewAngle);
    otherStone.velocityY = otherNewVelocity * sin(otherNewAngle);
    otherStone.x = otherStone.x + otherStone.velocityX;
    otherStone.y = otherStone.y + otherStone.velocityY;
  }

  /// checks if the stone is within boundaries and fixes pos & vel if needed
  void checkBoundaries() {
    if (x! - radius < sheet.left) {
      x = radius;
      velocityX = -velocityX;
    }
    if (x! + radius > sheet.right) {
      x = sheet.right - radius;
      velocityX = -velocityX;
    }
    if (y! - radius < sheet.top) {
      y = radius;
      velocityY = -velocityY;
    }
    if (y! + radius > sheet.bottom) {
      y = sheet.bottom - radius;
      velocityY = -velocityY;
    }
  }

  /// initialize the current stone
  void slide(double angle, double velocity) {
    this.angle = angle;
    this.velocity = velocity;
    double radians = angle * (pi / 180);
    if (!started) {
      started = true;
      velocityX = velocity * cos(radians);
      velocityY = velocity * sin(radians);
    }
  }

  /// low-quality phys engine by tikibeni (SheetPhysX)
  void update(double deltaTime, List<Stone> activeStones) {
    // Problems:
    // - collision almost always results in both zero velocities
    // - sometimes collision throws the stone in totally random direction
    double dragX;
    double dragY;

    if (velocityX.abs() > 0) {
      dragX = 0.5 * sheet.dynamicFriction * pow(velocityX, 2) / mass;
      if (dragX < 0.1) dragX = 0.1; // workaround to make the simulation end
      if (velocityX < 0) {
        velocityX += dragX;
      } else {
        velocityX -= dragX;
      }
    }

    if (velocityY.abs() > 0) {
      dragY = 0.5 * sheet.dynamicFriction * pow(velocityY, 2) / mass;
      if (dragY < 0.1) dragY = 0.1; // workaround to make the simulation end
      if (velocityY < 0) {
        velocityY += dragY;
      } else {
        velocityY -= dragY;
      }
    }

    if (velocityX.abs() < 0.05) {
      velocityX = 0.0;
    }

    if (velocityY.abs() < 0.05) {
      velocityY = 0.0;
    }

    if (velocityX > 0.0 || velocityY > 0.0) {
      checkBoundaries();
      for (final otherStone in activeStones) {
        if (otherStone != this &&
            isGoingToCollideWithStone(otherStone, deltaTime)) {
          handleStoneCollisionBetter(otherStone);
        }
      }
    } else {
      velocity = 0.0; // do NOT remove this.
    }
    x = x! + velocityX;
    y = y! + velocityY;
  }
}
