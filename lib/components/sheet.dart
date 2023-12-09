/// The playable area for the game
class Sheet {
  /// Self-explanatory
  static const double width = 4572; // cm, 45.72m
  /// Self-explanatory
  static const double height = 500; // cm, 5m
  static const double staticFriction = 0.05; // friction multiplier of ice
  static const double dynamicFriction = 0.03; // dyn. friction multiplier on ice
  static const double startingWidthPoint = 548.64;
  static const double startingHeightPoint = 500;
  static const double goalAreaCenterWidth = 3657.6;
  static const double goalAreaCenterHeight = startingHeightPoint;

  /// The radius from the center of the goal
  static const double goalRadius = 182.88;

  /// If the width of stone is less than this, remove stone from game.
  static const double noPointsBeforeWidth = 3017.52;

  double get top => 0;
  double get bottom => height;
  double get left => 0;
  double get right => width;
}
