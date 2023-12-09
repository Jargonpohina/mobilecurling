// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SlideImpl _$$SlideImplFromJson(Map<String, dynamic> json) => _$SlideImpl(
      angle: (json['angle'] as num?)?.toDouble() ?? 0.0,
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SlideImplToJson(_$SlideImpl instance) =>
    <String, dynamic>{
      'angle': instance.angle,
      'speed': instance.speed,
      'user': instance.user,
    };
