import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'similar_person.freezed.dart';

@freezed
abstract class SimilarPerson with _$SimilarPerson {
  const factory SimilarPerson({
    required Uint8List imgBytes,
    required int id,
    required String name,
  }) = _SimilarPerson;
}
