// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoneAPIImpl _$$StoneAPIImplFromJson(Map<String, dynamic> json) =>
    _$StoneAPIImpl(
      x: (json['x'] as num?)?.toDouble() ?? 0.0,
      y: (json['y'] as num?)?.toDouble() ?? 0.0,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoneAPIImplToJson(_$StoneAPIImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'user': instance.user,
    };
