// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  MessageType get type => throw _privateConstructorUsedError;

  /// If the type is join, then the message has the user information who has joined
  User? get user => throw _privateConstructorUsedError;

  /// If the type is slide, then the message has the information of sliding the stone
  Slide? get slide => throw _privateConstructorUsedError;

  /// The lobby that this message belongs to
  Lobby? get lobby => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({MessageType type, User? user, Slide? slide, Lobby? lobby});

  $UserCopyWith<$Res>? get user;
  $SlideCopyWith<$Res>? get slide;
  $LobbyCopyWith<$Res>? get lobby;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? user = freezed,
    Object? slide = freezed,
    Object? lobby = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      slide: freezed == slide
          ? _value.slide
          : slide // ignore: cast_nullable_to_non_nullable
              as Slide?,
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as Lobby?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SlideCopyWith<$Res>? get slide {
    if (_value.slide == null) {
      return null;
    }

    return $SlideCopyWith<$Res>(_value.slide!, (value) {
      return _then(_value.copyWith(slide: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LobbyCopyWith<$Res>? get lobby {
    if (_value.lobby == null) {
      return null;
    }

    return $LobbyCopyWith<$Res>(_value.lobby!, (value) {
      return _then(_value.copyWith(lobby: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MessageType type, User? user, Slide? slide, Lobby? lobby});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $SlideCopyWith<$Res>? get slide;
  @override
  $LobbyCopyWith<$Res>? get lobby;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? user = freezed,
    Object? slide = freezed,
    Object? lobby = freezed,
  }) {
    return _then(_$MessageImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      slide: freezed == slide
          ? _value.slide
          : slide // ignore: cast_nullable_to_non_nullable
              as Slide?,
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as Lobby?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl extends _Message {
  const _$MessageImpl(
      {required this.type,
      this.user = null,
      this.slide = null,
      this.lobby = null})
      : super._();

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final MessageType type;

  /// If the type is join, then the message has the user information who has joined
  @override
  @JsonKey()
  final User? user;

  /// If the type is slide, then the message has the information of sliding the stone
  @override
  @JsonKey()
  final Slide? slide;

  /// The lobby that this message belongs to
  @override
  @JsonKey()
  final Lobby? lobby;

  @override
  String toString() {
    return 'Message(type: $type, user: $user, slide: $slide, lobby: $lobby)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.slide, slide) || other.slide == slide) &&
            (identical(other.lobby, lobby) || other.lobby == lobby));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, user, slide, lobby);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message extends Message {
  const factory _Message(
      {required final MessageType type,
      final User? user,
      final Slide? slide,
      final Lobby? lobby}) = _$MessageImpl;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  MessageType get type;
  @override

  /// If the type is join, then the message has the user information who has joined
  User? get user;
  @override

  /// If the type is slide, then the message has the information of sliding the stone
  Slide? get slide;
  @override

  /// The lobby that this message belongs to
  Lobby? get lobby;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
