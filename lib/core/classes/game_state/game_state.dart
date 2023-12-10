import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilecurling/core/classes/lobby/lobby.dart';
import 'package:mobilecurling/core/classes/stone/stone.dart';
import 'package:mobilecurling/core/classes/user/user.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

enum State {
  @JsonValue('started')
  started,
  @JsonValue('ended')
  ended,
}

/// Game state. Create this class, fill it with data, and ship to the players with .toJson() method.
@freezed
class GameState with _$GameState {
  const GameState._();

  /// GameState constructor
  const factory GameState({
    /// The lobby of the game
    @Default(null) Lobby? lobby,

    /// Player 1 of the lobby
    @Default(null) User? playerOne,

    /// The score of Player 1
    @Default(0) int playerOneScore,

    /// Player 2 of the lobby
    @Default(null) User? playerTwo,

    /// The score of Player 2
    @Default(0) int playerTwoScore,

    /// The ID of the player who's turn it is now
    @Default(null) User? playerInTurn,

    /// If the players can slide a stone
    @Default(false) bool canSlide,
    @Default([]) List<StoneAPI> stones,

    /// The state of the game. It's either started or ended.
    @Default(State.started) State gameState,
  }) = _GameState;

  /// From json function
  factory GameState.fromJson(Map<String, Object?> json) => _$GameStateFromJson(json);
}
