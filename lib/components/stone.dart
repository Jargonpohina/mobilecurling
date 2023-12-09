/// Curling stone object
class Stone {
  /// Constructor
  Stone({required this.x, required this.y});

  double? x;
  double? y;
  double radius = 14.53;
  double mass = 19.96;

  void moveTo(double dx, double dy) {
    x = dx;
    y = dy;
  }

  bool isCollidingWith(Stone otherStone) {
    double distanceSquared = (x! - otherStone.x!) * (x! - otherStone.x!) +
        (y! - otherStone.y!) * (y! - otherStone.y!);
    double minDistanceSquared =
        (radius + otherStone.radius) * (radius + otherStone.radius);
    return distanceSquared < minDistanceSquared;
  }
}
