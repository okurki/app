import 'package:freezed_annotation/freezed_annotation.dart';

part 'inference.freezed.dart';
part 'inference.g.dart';

@freezed
abstract class Inference with _$Inference {
  const factory Inference({
    required int id,
    @JsonKey(name: 'user_id')
    required int userId,
    required List<Celebrity> celebrities,
    required double attractiveness,
    @IsoDateTimeConverter()
    required DateTime timestamp,
  }) = _Inference;

  factory Inference.fromJson(Map<String, dynamic> json) => _$InferenceFromJson(json);
}

@freezed
abstract class Celebrity with _$Celebrity {
  const factory Celebrity({
    required int id,
    required String name,
    @JsonKey(name: 'img_path')
    required String imgPath,
  }) = _Celebrity;

  factory Celebrity.fromJson(Map<String, dynamic> json) => _$CelebrityFromJson(json);
}

class IsoDateTimeConverter implements JsonConverter<DateTime, String> {
  const IsoDateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
