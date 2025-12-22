import 'package:dio/dio.dart';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:okurki_app/core/logger.dart';
import 'package:okurki_app/features/classification/domain/models/inference.dart';

abstract interface class ClassificationRepo {
  Future<Inference> classify(XFile image);

  Future<void> rateCelebrity({
    required int inferenceID,
    required int celebrityID,
    required bool isValid,
  });
}

@Singleton(as: ClassificationRepo, env: [Environment.dev])
class ClassificationRepoImpl implements ClassificationRepo {
  ClassificationRepoImpl(Dio dio) : _dio = dio;

  final Dio _dio;

  @override
  Future<Inference> classify(XFile image) async {
    final binary = await image.readAsBytes();
    final imageFile = MultipartFile.fromBytes(
      binary,
      filename: image.name,
      contentType: DioMediaType('image', 'jpeg'),
    );
    final formData = FormData.fromMap({
      'image_file': imageFile,
    });

    try {
      final result = await _dio.post<Map<String, dynamic>>(
        '/ml/users/me/inference',
        data: formData,
      );
      logger.t(result);
      final inference = Inference.fromJson(result.data!);

      // Just debugging:
      return inference.copyWith(celebrities: inference.celebrities.reversed.toList());
      // return inference;
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> rateCelebrity({
    required int inferenceID,
    required int celebrityID,
    required bool isValid,
  }) async {
    try {
      final result = await _dio.post<Map<String, dynamic>>(
        '/ml/users/me/feedback',
        data: {
          'inference_id': inferenceID,
          'celebrity_id': celebrityID,
          'feedback_type': isValid ? 'like' : 'dislike',
        },
      );
      logger.t(result);
    } on Exception catch (e) {
      logger.e(e);
    }
  }
}
