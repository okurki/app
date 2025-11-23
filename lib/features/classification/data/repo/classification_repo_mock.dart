import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:okurki_app/features/classification/data/models/classify_result.dart';
import 'package:okurki_app/features/classification/data/models/similar_person.dart';
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart';

class ClassificationRepoMock implements ClassificationRepo {
  @override
  Future<(ClassifyResult, List<SimilarPerson>)> classify(XFile image) async {
    await Future<void>.delayed(const Duration(milliseconds: 1300));
    final json = {'prediction': 0.81};

    final similar = <SimilarPerson>[];
    const celebs = [
      'Scarlett Johansson',
      'Brad Pitt',
      'Zendaya',
      'Chris Hemsworth',
      'Emma Stone',
    ];

    for (int i = 1; i < 6; i++) {
      final data = await rootBundle.load('assets/celebs_imgs/ceb$i.png');
      final person = SimilarPerson(
        imgBytes: data.buffer.asUint8List(),
        id: DateTime.now().millisecondsSinceEpoch,
        name: celebs[i - 1],
      );
      similar.add(person);
    }

    return (ClassifyResult.fromJson(json), similar);
  }
}
