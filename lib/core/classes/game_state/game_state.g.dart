// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      lobby: json['lobby'] == null
          ? null
          : Lobby.fromJson(json['lobby'] as Map<String, dynamic>),
      playerOne: json['playerOne'] == null
          ? null
          : User.fromJson(json['playerOne'] as Map<String, dynamic>),
      playerOneScore: json['playerOneScore'] as int? ?? 0,
      playerTwo: json['playerTwo'] == null
          ? null
          : User.fromJson(json['playerTwo'] as Map<String, dynamic>),
      playerTwoScore: json['playerTwoScore'] as int? ?? 0,
      playerInTurn: json['playerInTurn'] == null
          ? null
          : User.fromJson(json['playerInTurn'] as Map<String, dynamic>),
      canSlide: json['canSlide'] as bool? ?? false,
      stones: (json['stones'] as List<dynamic>?)
              ?.map((e) => StoneAPI.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      gameState: $enumDecodeNullable(_$StateEnumMap, json['gameState']) ??
          State.started,
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'lobby': instance.lobby,
      'playerOne': instance.playerOne,
      'playerOneScore': instance.playerOneScore,
      'playerTwo': instance.playerTwo,
      'playerTwoScore': instance.playerTwoScore,
      'playerInTurn': instance.playerInTurn,
      'canSlide': instance.canSlide,
      'stones': instance.stones,
      'gameState': _$StateEnumMap[instance.gameState]!,
    };

const _$StateEnumMap = {
  State.started: 'started',
  State.ended: 'ended',
};
