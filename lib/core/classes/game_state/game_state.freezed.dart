// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  /// The lobby of the game
  Lobby? get lobby => throw _privateConstructorUsedError;

  /// Player 1 of the lobby
  User? get playerOne => throw _privateConstructorUsedError;

  /// The score of Player 1
  int get playerOneScore => throw _privateConstructorUsedError;

  /// Player 2 of the lobby
  User? get playerTwo => throw _privateConstructorUsedError;

  /// The score of Player 2
  int get playerTwoScore => throw _privateConstructorUsedError;

  /// The ID of the player who's turn it is now
  User? get playerInTurn => throw _privateConstructorUsedError;

  /// If the players can slide a stone
  bool get canSlide => throw _privateConstructorUsedError;
  List<StoneAPI> get stones => throw _privateConstructorUsedError;

  /// The state of the game. It's either started or ended.
  State get gameState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {Lobby? lobby,
      User? playerOne,
      int playerOneScore,
      User? playerTwo,
      int playerTwoScore,
      User? playerInTurn,
      bool canSlide,
      List<StoneAPI> stones,
      State gameState});

  $LobbyCopyWith<$Res>? get lobby;
  $UserCopyWith<$Res>? get playerOne;
  $UserCopyWith<$Res>? get playerTwo;
  $UserCopyWith<$Res>? get playerInTurn;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lobby = freezed,
    Object? playerOne = freezed,
    Object? playerOneScore = null,
    Object? playerTwo = freezed,
    Object? playerTwoScore = null,
    Object? playerInTurn = freezed,
    Object? canSlide = null,
    Object? stones = null,
    Object? gameState = null,
  }) {
    return _then(_value.copyWith(
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as Lobby?,
      playerOne: freezed == playerOne
          ? _value.playerOne
          : playerOne // ignore: cast_nullable_to_non_nullable
              as User?,
      playerOneScore: null == playerOneScore
          ? _value.playerOneScore
          : playerOneScore // ignore: cast_nullable_to_non_nullable
              as int,
      playerTwo: freezed == playerTwo
          ? _value.playerTwo
          : playerTwo // ignore: cast_nullable_to_non_nullable
              as User?,
      playerTwoScore: null == playerTwoScore
          ? _value.playerTwoScore
          : playerTwoScore // ignore: cast_nullable_to_non_nullable
              as int,
      playerInTurn: freezed == playerInTurn
          ? _value.playerInTurn
          : playerInTurn // ignore: cast_nullable_to_non_nullable
              as User?,
      canSlide: null == canSlide
          ? _value.canSlide
          : canSlide // ignore: cast_nullable_to_non_nullable
              as bool,
      stones: null == stones
          ? _value.stones
          : stones // ignore: cast_nullable_to_non_nullable
              as List<StoneAPI>,
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as State,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get playerOne {
    if (_value.playerOne == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.playerOne!, (value) {
      return _then(_value.copyWith(playerOne: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get playerTwo {
    if (_value.playerTwo == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.playerTwo!, (value) {
      return _then(_value.copyWith(playerTwo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get playerInTurn {
    if (_value.playerInTurn == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.playerInTurn!, (value) {
      return _then(_value.copyWith(playerInTurn: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Lobby? lobby,
      User? playerOne,
      int playerOneScore,
      User? playerTwo,
      int playerTwoScore,
      User? playerInTurn,
      bool canSlide,
      List<StoneAPI> stones,
      State gameState});

  @override
  $LobbyCopyWith<$Res>? get lobby;
  @override
  $UserCopyWith<$Res>? get playerOne;
  @override
  $UserCopyWith<$Res>? get playerTwo;
  @override
  $UserCopyWith<$Res>? get playerInTurn;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lobby = freezed,
    Object? playerOne = freezed,
    Object? playerOneScore = null,
    Object? playerTwo = freezed,
    Object? playerTwoScore = null,
    Object? playerInTurn = freezed,
    Object? canSlide = null,
    Object? stones = null,
    Object? gameState = null,
  }) {
    return _then(_$GameStateImpl(
      lobby: freezed == lobby
          ? _value.lobby
          : lobby // ignore: cast_nullable_to_non_nullable
              as Lobby?,
      playerOne: freezed == playerOne
          ? _value.playerOne
          : playerOne // ignore: cast_nullable_to_non_nullable
              as User?,
      playerOneScore: null == playerOneScore
          ? _value.playerOneScore
          : playerOneScore // ignore: cast_nullable_to_non_nullable
              as int,
      playerTwo: freezed == playerTwo
          ? _value.playerTwo
          : playerTwo // ignore: cast_nullable_to_non_nullable
              as User?,
      playerTwoScore: null == playerTwoScore
          ? _value.playerTwoScore
          : playerTwoScore // ignore: cast_nullable_to_non_nullable
              as int,
      playerInTurn: freezed == playerInTurn
          ? _value.playerInTurn
          : playerInTurn // ignore: cast_nullable_to_non_nullable
              as User?,
      canSlide: null == canSlide
          ? _value.canSlide
          : canSlide // ignore: cast_nullable_to_non_nullable
              as bool,
      stones: null == stones
          ? _value._stones
          : stones // ignore: cast_nullable_to_non_nullable
              as List<StoneAPI>,
      gameState: null == gameState
          ? _value.gameState
          : gameState // ignore: cast_nullable_to_non_nullable
              as State,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl extends _GameState {
  const _$GameStateImpl(
      {this.lobby = null,
      this.playerOne = null,
      this.playerOneScore = 0,
      this.playerTwo = null,
      this.playerTwoScore = 0,
      this.playerInTurn = null,
      this.canSlide = false,
      final List<StoneAPI> stones = const [],
      this.gameState = State.started})
      : _stones = stones,
        super._();

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  /// The lobby of the game
  @override
  @JsonKey()
  final Lobby? lobby;

  /// Player 1 of the lobby
  @override
  @JsonKey()
  final User? playerOne;

  /// The score of Player 1
  @override
  @JsonKey()
  final int playerOneScore;

  /// Player 2 of the lobby
  @override
  @JsonKey()
  final User? playerTwo;

  /// The score of Player 2
  @override
  @JsonKey()
  final int playerTwoScore;

  /// The ID of the player who's turn it is now
  @override
  @JsonKey()
  final User? playerInTurn;

  /// If the players can slide a stone
  @override
  @JsonKey()
  final bool canSlide;
  final List<StoneAPI> _stones;
  @override
  @JsonKey()
  List<StoneAPI> get stones {
    if (_stones is EqualUnmodifiableListView) return _stones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stones);
  }

  /// The state of the game. It's either started or ended.
  @override
  @JsonKey()
  final State gameState;

  @override
  String toString() {
    return 'GameState(lobby: $lobby, playerOne: $playerOne, playerOneScore: $playerOneScore, playerTwo: $playerTwo, playerTwoScore: $playerTwoScore, playerInTurn: $playerInTurn, canSlide: $canSlide, stones: $stones, gameState: $gameState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.lobby, lobby) || other.lobby == lobby) &&
            (identical(other.playerOne, playerOne) ||
                other.playerOne == playerOne) &&
            (identical(other.playerOneScore, playerOneScore) ||
                other.playerOneScore == playerOneScore) &&
            (identical(other.playerTwo, playerTwo) ||
                other.playerTwo == playerTwo) &&
            (identical(other.playerTwoScore, playerTwoScore) ||
                other.playerTwoScore == playerTwoScore) &&
            (identical(other.playerInTurn, playerInTurn) ||
                other.playerInTurn == playerInTurn) &&
            (identical(other.canSlide, canSlide) ||
                other.canSlide == canSlide) &&
            const DeepCollectionEquality().equals(other._stones, _stones) &&
            (identical(other.gameState, gameState) ||
                other.gameState == gameState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lobby,
      playerOne,
      playerOneScore,
      playerTwo,
      playerTwoScore,
      playerInTurn,
      canSlide,
      const DeepCollectionEquality().hash(_stones),
      gameState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(
      this,
    );
  }
}

abstract class _GameState extends GameState {
  const factory _GameState(
      {final Lobby? lobby,
      final User? playerOne,
      final int playerOneScore,
      final User? playerTwo,
      final int playerTwoScore,
      final User? playerInTurn,
      final bool canSlide,
      final List<StoneAPI> stones,
      final State gameState}) = _$GameStateImpl;
  const _GameState._() : super._();

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override

  /// The lobby of the game
  Lobby? get lobby;
  @override

  /// Player 1 of the lobby
  User? get playerOne;
  @override

  /// The score of Player 1
  int get playerOneScore;
  @override

  /// Player 2 of the lobby
  User? get playerTwo;
  @override

  /// The score of Player 2
  int get playerTwoScore;
  @override

  /// The ID of the player who's turn it is now
  User? get playerInTurn;
  @override

  /// If the players can slide a stone
  bool get canSlide;
  @override
  List<StoneAPI> get stones;
  @override

  /// The state of the game. It's either started or ended.
  State get gameState;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
