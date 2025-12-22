import 'dart:math';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:okurki_app/features/classification/data/models/similar_person.dart';
import 'package:okurki_app/features/classification/domain/models/inference.dart';
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart';

@Singleton(as: ClassificationRepo, env: [Environment.test])
class ClassificationRepoMock implements ClassificationRepo {
  @override
  Future<Inference> classify(XFile image) async {
    await Future<void>.delayed(const Duration(milliseconds: 1300));

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

    final rand = Random();

    return Inference(
      id: rand.nextInt(1e6.toInt()),
      userId: rand.nextInt(1e6.toInt()),
      celebrities: [Celebrity(id: rand.nextInt(1e6.toInt()), name: 'Penis Penisovich', imgPath: 'some_path.img')],
      attractiveness: 0.71,
      timestamp: DateTime.now(),
    );
  }
  
  @override
  Future<void> rateCelebrity({required int inferenceID, required int celebrityID, required bool isValid}) {
    // TODO: implement rateCelebrity
    throw UnimplementedError();
  }
}
