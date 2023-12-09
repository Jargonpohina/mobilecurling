// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slide.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Slide _$SlideFromJson(Map<String, dynamic> json) {
  return _Slide.fromJson(json);
}

/// @nodoc
mixin _$Slide {
  /// The angle of the stone. 0 means towards the goal.
  double get angle => throw _privateConstructorUsedError;

  /// The speed of the stone
  double get speed => throw _privateConstructorUsedError;

  /// User that has thrown the stone
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlideCopyWith<Slide> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlideCopyWith<$Res> {
  factory $SlideCopyWith(Slide value, $Res Function(Slide) then) =
      _$SlideCopyWithImpl<$Res, Slide>;
  @useResult
  $Res call({double angle, double speed, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SlideCopyWithImpl<$Res, $Val extends Slide>
    implements $SlideCopyWith<$Res> {
  _$SlideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? angle = null,
    Object? speed = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
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
}

/// @nodoc
abstract class _$$SlideImplCopyWith<$Res> implements $SlideCopyWith<$Res> {
  factory _$$SlideImplCopyWith(
          _$SlideImpl value, $Res Function(_$SlideImpl) then) =
      __$$SlideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double angle, double speed, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SlideImplCopyWithImpl<$Res>
    extends _$SlideCopyWithImpl<$Res, _$SlideImpl>
    implements _$$SlideImplCopyWith<$Res> {
  __$$SlideImplCopyWithImpl(
      _$SlideImpl _value, $Res Function(_$SlideImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? angle = null,
    Object? speed = null,
    Object? user = freezed,
  }) {
    return _then(_$SlideImpl(
      angle: null == angle
          ? _value.angle
          : angle // ignore: cast_nullable_to_non_nullable
              as double,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SlideImpl extends _Slide {
  const _$SlideImpl({this.angle = 0.0, this.speed = 0.0, this.user = null})
      : super._();

  factory _$SlideImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlideImplFromJson(json);

  /// The angle of the stone. 0 means towards the goal.
  @override
  @JsonKey()
  final double angle;

  /// The speed of the stone
  @override
  @JsonKey()
  final double speed;

  /// User that has thrown the stone
  @override
  @JsonKey()
  final User? user;

  @override
  String toString() {
    return 'Slide(angle: $angle, speed: $speed, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlideImpl &&
            (identical(other.angle, angle) || other.angle == angle) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, angle, speed, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SlideImplCopyWith<_$SlideImpl> get copyWith =>
      __$$SlideImplCopyWithImpl<_$SlideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlideImplToJson(
      this,
    );
  }
}

abstract class _Slide extends Slide {
  const factory _Slide(
      {final double angle, final double speed, final User? user}) = _$SlideImpl;
  const _Slide._() : super._();

  factory _Slide.fromJson(Map<String, dynamic> json) = _$SlideImpl.fromJson;

  @override

  /// The angle of the stone. 0 means towards the goal.
  double get angle;
  @override

  /// The speed of the stone
  double get speed;
  @override

  /// User that has thrown the stone
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$SlideImplCopyWith<_$SlideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
