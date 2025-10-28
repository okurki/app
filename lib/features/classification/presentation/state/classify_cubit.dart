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

  @override
  void onChange(Change<ClassifyState> change) {
    super.onChange(change);
    // print(change);
  }

  Future<void> classify(XFile picture) async {
    if (state is! _ClassifyStateIdle) return;
    emit(ClassifyState.loading(image: picture));
    try {
      final classifyResult = await _classificationRepo.classify(picture);
      emit(ClassifyState.success(value: classifyResult, image: picture));
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
