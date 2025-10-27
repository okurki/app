import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:okurki_app/features/classification/data/models/classify_result.dart';
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart';

part 'classify_cubit.freezed.dart';
part 'classify_state.dart';

class ClassifyCubit extends Cubit<ClassifyState> {
  ClassifyCubit({required ClassificationRepo repo})
    : _classificationRepo = repo,
      super(const ClassifyState.idle());

  final ClassificationRepo _classificationRepo;

  Future<void> classify(XFile picture) async {
    emit(const ClassifyState.loading());
    try {
      final classifyResult = await _classificationRepo.classify(picture);
      emit(ClassifyState.success(value: classifyResult));
    } on Exception catch (e, st) {
      emit(ClassifyState.error(e, st));
    }
  }
}
