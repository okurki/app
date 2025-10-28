import 'package:freezed_annotation/freezed_annotation.dart';

part 'classify_result.freezed.dart';
part 'classify_result.g.dart';

@freezed
abstract class ClassifyResult with _$ClassifyResult {
  const factory ClassifyResult({required int prediction}) = _ClassifyResult;

  factory ClassifyResult.fromJson(Map<String, dynamic> json) =>
      _$ClassifyResultFromJson(json);
}
