// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Inference _$InferenceFromJson(Map<String, dynamic> json) => _Inference(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  celebrities: (json['celebrities'] as List<dynamic>)
      .map((e) => Celebrity.fromJson(e as Map<String, dynamic>))
      .toList(),
  attractiveness: (json['attractiveness'] as num).toDouble(),
  timestamp: const IsoDateTimeConverter().fromJson(json['timestamp'] as String),
);

Map<String, dynamic> _$InferenceToJson(_Inference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'celebrities': instance.celebrities,
      'attractiveness': instance.attractiveness,
      'timestamp': const IsoDateTimeConverter().toJson(instance.timestamp),
    };

_Celebrity _$CelebrityFromJson(Map<String, dynamic> json) => _Celebrity(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  imgPath: json['img_path'] as String,
);

Map<String, dynamic> _$CelebrityToJson(_Celebrity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img_path': instance.imgPath,
    };
