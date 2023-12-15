// ignore_for_file: flutter_style_todos, lines_longer_than_80_chars

import 'dart:math';
import 'package:mobilecurling/components/sheet.dart';
import 'package:mobilecurling/core/shared_classes/user/user.dart';
import 'package:uuid/uuid.dart';

/// Curling stone object
class Stone {
  /// Constructor
  Stone({required this.user}) : id = const Uuid().v4();

  /// The game area
  Sheet sheet = Sheet();

  /// User of the stone
  User? user;

  /// UUIDv4 of the stone
  final String id;

  /// Radius (cm) of the stone. Should actually be 14.53cm, but client scales to 64x64 sprite
  static const double radius = 32;

  /// Mass of the stone in kilograms for drag calculation
  static const double mass = 19.96;

  /// Initial x-coordinate
  double x = 548.64;

  /// Initial y-coordinate
  double y = 250;

  /// Overall velocity vector
  double velocity = 0;

  /// Horizontal component of the velocity
  double velocityX = 0;

  /// Vertical component of the velocity
  double velocityY = 0;

  /// Has the slide function fired on the stone
  bool started = false;

  /// For the lock mechanism of the stone collisions
  List<String> collisionLocks = [];

  /// helper function to check if stone will collide during the next step
  bool isGoingToCollideWithStone(Stone otherStone, double deltaTime) {
    final futureX = x + velocityX * deltaTime;
    final futureY = y + velocityY * deltaTime;

    final otherFutureX = otherStone.x + otherStone.velocityX * deltaTime;
    final otherFutureY = otherStone.y + otherStone.velocityY * deltaTime;

    final distance =
        sqrt(pow(futureX - otherFutureX, 2) + pow(futureY - otherFutureY, 2));

    return distance < 2 * radius; // less than radius + otherStone.radius
  }

  /// calculates collision
  void handleStoneCollisionWithVelocities(Stone otherStone) {
    collisionLocks.add(otherStone.id);

    final relVelX = velocityX - otherStone.velocityX;
    final relVelY = velocityY - otherStone.velocityY;
    final magnitude = sqrt(pow(relVelX, 2) + pow(relVelY, 2));
    final collX = relVelX / magnitude;
    final collY = relVelY / magnitude;
    final thisNewScalarVel = 0.5 * relVelX * collX + relVelY * collY;
    final thisNewVelocityX = collX * thisNewScalarVel;
    final thisNewVelocityY = collY * thisNewScalarVel;
    // final thisNewAngle = (collX * relVelY - collY * relVelX) / (collX * relVelX + collY * relVelY);
    final otherNewScalarVel = 0.5 * relVelX * (-collX) + relVelY * (-collY);
    final otherNewVelocityX = -collX * otherNewScalarVel;
    final otherNewVelocityY = -collY * otherNewScalarVel;
    // final otherNewAngle = ((-collX * relVelY) - (-collY * relVelX)) / ((-collX * relVelX) + (-collY * relVelY));

    velocityX = thisNewVelocityX;
    velocityY = thisNewVelocityY;

    otherStone
      ..velocityX = otherNewVelocityX
      ..velocityY = otherNewVelocityY
      ..x = otherStone.x + otherStone.velocityX
      ..y = otherStone.y + otherStone.velocityY
      ..checkBoundaries();

    collisionLocks.remove(otherStone.id);
  }

  /// checks if velocity vectors should be zeroed to make simulation end
  void isItTimeToStop() {
    if (velocityX.abs() < 0.05) {
      velocityX = 0.0;
    }

    if (velocityY.abs() < 0.05) {
      velocityY = 0.0;
    }
  }

  /// checks the conditions for stone movement and acts accordingly
  void handleMovement(List<Stone> activeStones, double deltaTime) {
    if (velocityX > 0.0 || velocityY > 0.0) {
      checkBoundaries();
      for (final otherStone in activeStones) {
        if (otherStone != this) {
          final willCollide = isGoingToCollideWithStone(otherStone, deltaTime);
          final otherLocked = otherStone.collisionLocks.contains(id);

          if (willCollide && !otherLocked) {
            handleStoneCollisionWithVelocities(otherStone);
          }
        }
      }
      x = x + velocityX;
      y = y + velocityY;
    } else {
      velocity = 0.0;
    }
  }

  /// checks if the stone is within boundaries and fixes pos & vel if needed
  void checkBoundaries() {
    if (x - radius < sheet.left) {
      x = radius;
      velocityX = -velocityX;
    }
    if (x + radius > sheet.right) {
      x = sheet.right - radius;
      velocityX = -velocityX;
    }
    if (y - radius < sheet.top) {
      y = radius;
      velocityY = -velocityY;
    }
    if (y + radius > sheet.bottom) {
      y = sheet.bottom - radius;
      velocityY = -velocityY;
    }
  }

  /// calculates the drag effect on stone movement
  void handleDrag() {
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
  }

  /// low-quality and handcrafted physengine (SheetPhysX) by tikibeni
  void update(double deltaTime, List<Stone> activeStones) {
    handleDrag();
    isItTimeToStop();
    handleMovement(activeStones, deltaTime);
  }

  /// initialize the stone values
  void slide(double angle, double velocity) {
    this.velocity = velocity;
    final radians = angle * (pi / 180);
    if (!started) {
      started = true;
      velocityX = velocity * cos(radians);
      velocityY = velocity * sin(radians);
    }
  }
}
