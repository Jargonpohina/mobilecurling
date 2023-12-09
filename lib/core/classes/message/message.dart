import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilecurling/core/classes/lobby/lobby.dart';
import 'package:mobilecurling/core/classes/slide/slide.dart';
import 'package:mobilecurling/core/classes/user/user.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageType {
  @JsonValue('join')
  join,
  @JsonValue('slide')
  slide,
}

/// User itself.
@freezed
class Message with _$Message {
  const Message._();

  /// Lobby constructor
  const factory Message({
    required MessageType type,

    /// If the type is join, then the message has the user information who has joined
    @Default(null) User? user,

    /// If the type is slide, then the message has the information of sliding the stone
    @Default(null) Slide? slide,

    /// The lobby that this message belongs to
    @Default(null) Lobby? lobby,
  }) = _Message;

  /// From json function
  factory Message.fromJson(Map<String, Object?> json) => _$MessageFromJson(json);
}
