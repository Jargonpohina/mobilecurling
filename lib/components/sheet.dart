/// The playable area for the game
class Sheet {
  /// Self-explanatory
  static const double width = 4572; // cm, 45.72m
  /// Self-explanatory
  static const double height = 500; // cm, 5m

  double get top => 0;
  double get bottom => height;
  double get left => 0;
  double get right => width;

  // TODO: määritä maalialue
}
