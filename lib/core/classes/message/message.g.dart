// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      slide: json['slide'] == null
          ? null
          : Slide.fromJson(json['slide'] as Map<String, dynamic>),
      lobby: json['lobby'] == null
          ? null
          : Lobby.fromJson(json['lobby'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'type': _$MessageTypeEnumMap[instance.type]!,
      'user': instance.user,
      'slide': instance.slide,
      'lobby': instance.lobby,
    };

const _$MessageTypeEnumMap = {
  MessageType.join: 'join',
  MessageType.slide: 'slide',
};
