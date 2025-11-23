import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:okurki_app/features/classification/data/models/classify_result.dart';
import 'package:okurki_app/features/classification/data/models/similar_person.dart';
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart';

part 'classify_cubit.freezed.dart';
part 'classify_state.dart';

class ClassifyCubit extends Cubit<ClassifyState> {
  ClassifyCubit({required ClassificationRepo repo}) : _classificationRepo = repo, super(const ClassifyState.idle());

  final ClassificationRepo _classificationRepo;

  @override
  void onChange(Change<ClassifyState> change) {
    super.onChange(change);
    // print(change);
  }

  Future<void> debugResultsScreen() async {
    const value = ClassifyResult(prediction: 0.12);
    const path =
        '/Users/chabanovz/Library/Developer/CoreSimulator/Devices/A71579C9-2CD4-4854-9B81-2D0435A8DEE6/data/Containers/Data/Application/79CB2FCF-BA14-4913-BF24-63B3AB903166/tmp/image_picker_6C5A4649-60AA-4849-B2C0-A288A6F1CF54-61680-000028D13BE1C3DA.jpg';
    final XFile image = XFile(path);

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

    emit(ClassifyState.success(image: image, value: value, similarPeople: similar));
  }

  Future<void> classify(XFile picture) async {
    if (state is! _ClassifyStateIdle) return;
    emit(ClassifyState.loading(image: picture));
    try {
      final classifyResult = await _classificationRepo.classify(picture);
      emit(ClassifyState.success(value: classifyResult.$1, image: picture, similarPeople: classifyResult.$2));
    } on Exception catch (e, st) {
      emit(ClassifyState.error(e, st));
    }
  }

  /// Safe to use in async gaps.
  void reset() {
    if (isClosed) return;
    emit(const ClassifyState.idle());
  }
}
