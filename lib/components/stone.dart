import 'package:uuid/uuid.dart';
import 'package:mobilecurling/core/classes/user/user.dart';

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

  void moveTo(double dx, double dy) {
    x = dx;
    y = dy;
  }

  bool isCollidingWith(Stone otherStone) {
    double distanceSquared = (x! - otherStone.x!) * (x! - otherStone.x!) +
        (y! - otherStone.y!) * (y! - otherStone.y!);
    double minDistanceSquared = (2 * radius) * (2 * radius);
    return distanceSquared < minDistanceSquared;
  }

  void calcNextCoordinate(double angle, double speed) {}
}
