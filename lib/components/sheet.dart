/// The playable area for the game
class Sheet {
  /// Self-explanatory
  static const double width = 4572; // cm, 45.72m
  /// Self-explanatory
  static const double height = 500; // cm, 5m
  final double staticFriction = 0.05; // friction multiplier of ice
  final double dynamicFriction = 0.03; // dyn. friction multiplier on ice
  final double startingWidthPoint = 548.64;
  final double startingHeightPoint = 250;
  final double goalAreaCenterWidth = 3657.6;
  final double goalAreaCenterHeight = 250;

  /// The radius from the center of the goal
  final double goalRadius = 182.88;

  /// If the width of stone is less than this, remove stone from game.
  final double noPointsBeforeWidth = 3017.52;

  double get top => 0;
  double get bottom => height;
  double get left => 0;
  double get right => width;
}
