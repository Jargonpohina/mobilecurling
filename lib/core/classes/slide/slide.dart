import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilecurling/core/classes/user/user.dart';

part 'slide.freezed.dart';
part 'slide.g.dart';

/// The slide data. Who has thrown the stone and at what angle and speed.
@freezed
class Slide with _$Slide {
  const Slide._();

  /// Lobby constructor
  const factory Slide({
    /// The angle of the stone. 0 means towards the goal.
    @Default(0.0) double angle,

    /// The speed of the stone
    @Default(0.0) double speed,

    /// User that has thrown the stone
    @Default(null) User? user,
  }) = _Slide;

  /// From json function
  factory Slide.fromJson(Map<String, Object?> json) => _$SlideFromJson(json);
}
