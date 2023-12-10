// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoneAPI _$StoneAPIFromJson(Map<String, dynamic> json) {
  return _StoneAPI.fromJson(json);
}

/// @nodoc
mixin _$StoneAPI {
  /// X coordinate of the stone
  double get x => throw _privateConstructorUsedError;

  /// Y coordinate of the stone
  double get y => throw _privateConstructorUsedError;

  /// Has the stone been slid
  bool get started => throw _privateConstructorUsedError;

  /// The ID of the stone
  String get id => throw _privateConstructorUsedError;

  /// The user who threw this stone
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoneAPICopyWith<StoneAPI> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoneAPICopyWith<$Res> {
  factory $StoneAPICopyWith(StoneAPI value, $Res Function(StoneAPI) then) =
      _$StoneAPICopyWithImpl<$Res, StoneAPI>;
  @useResult
  $Res call({double x, double y, bool started, String id, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$StoneAPICopyWithImpl<$Res, $Val extends StoneAPI>
    implements $StoneAPICopyWith<$Res> {
  _$StoneAPICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? started = null,
    Object? id = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      started: null == started
          ? _value.started
          : started // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$StoneAPIImplCopyWith<$Res>
    implements $StoneAPICopyWith<$Res> {
  factory _$$StoneAPIImplCopyWith(
          _$StoneAPIImpl value, $Res Function(_$StoneAPIImpl) then) =
      __$$StoneAPIImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, bool started, String id, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$StoneAPIImplCopyWithImpl<$Res>
    extends _$StoneAPICopyWithImpl<$Res, _$StoneAPIImpl>
    implements _$$StoneAPIImplCopyWith<$Res> {
  __$$StoneAPIImplCopyWithImpl(
      _$StoneAPIImpl _value, $Res Function(_$StoneAPIImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? started = null,
    Object? id = null,
    Object? user = freezed,
  }) {
    return _then(_$StoneAPIImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      started: null == started
          ? _value.started
          : started // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoneAPIImpl extends _StoneAPI {
  const _$StoneAPIImpl(
      {this.x = 0.0,
      this.y = 0.0,
      this.started = false,
      this.id = '',
      this.user = null})
      : super._();

  factory _$StoneAPIImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoneAPIImplFromJson(json);

  /// X coordinate of the stone
  @override
  @JsonKey()
  final double x;

  /// Y coordinate of the stone
  @override
  @JsonKey()
  final double y;

  /// Has the stone been slid
  @override
  @JsonKey()
  final bool started;

  /// The ID of the stone
  @override
  @JsonKey()
  final String id;

  /// The user who threw this stone
  @override
  @JsonKey()
  final User? user;

  @override
  String toString() {
    return 'StoneAPI(x: $x, y: $y, started: $started, id: $id, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoneAPIImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.started, started) || other.started == started) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, started, id, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoneAPIImplCopyWith<_$StoneAPIImpl> get copyWith =>
      __$$StoneAPIImplCopyWithImpl<_$StoneAPIImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoneAPIImplToJson(
      this,
    );
  }
}

abstract class _StoneAPI extends StoneAPI {
  const factory _StoneAPI(
      {final double x,
      final double y,
      final bool started,
      final String id,
      final User? user}) = _$StoneAPIImpl;
  const _StoneAPI._() : super._();

  factory _StoneAPI.fromJson(Map<String, dynamic> json) =
      _$StoneAPIImpl.fromJson;

  @override

  /// X coordinate of the stone
  double get x;
  @override

  /// Y coordinate of the stone
  double get y;
  @override

  /// Has the stone been slid
  bool get started;
  @override

  /// The ID of the stone
  String get id;
  @override

  /// The user who threw this stone
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$StoneAPIImplCopyWith<_$StoneAPIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
