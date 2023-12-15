/// The playable area for the game
class Sheet {
  /// Width of the area
  static const double width = 4572; // cm, 45.72m
  /// Height of the area
  static const double height = 500; // cm, 5m
  /// friction multiplier of ice
  final double staticFriction = 0.05;

  /// dynamic friction multiplier on ice
  final double dynamicFriction = 0.03;

  /// starting x-coordinate for stones
  final double startingWidthPoint = 548.64;

  /// starting y-coordinate for stones
  final double startingHeightPoint = 250;

  /// center of goal x-coordinate
  final double goalAreaCenterWidth = 3657.6;

  /// center of goal y-coordinate
  final double goalAreaCenterHeight = 250;

  /// The radius from the center of the goal
  final double goalRadius = 182.88;

  /// If the width of stone is less than this, remove stone from game.
  final double noPointsBeforeWidth = 3017.52;

  /// Top wall coordinate
  double get top => 0;

  /// Bottom wall coordinate
  double get bottom => height;

  /// Left wall coordinate
  double get left => 0;

  /// Right wall coordinate
  double get right => width;
}
