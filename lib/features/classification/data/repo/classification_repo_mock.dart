import 'package:image_picker/image_picker.dart';

import 'package:okurki_app/features/classification/data/models/classify_result.dart';
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart';

class ClassificationRepoMock implements ClassificationRepo {
  @override
  Future<ClassifyResult> classify(XFile image) async {
    await Future<void>.delayed(const Duration(milliseconds: 1300));
    final json = {'prediction': 4};
    return ClassifyResult.fromJson(json);
  }
}
