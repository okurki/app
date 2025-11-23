part of 'classify_cubit.dart';

@freezed
sealed class ClassifyState with _$ClassifyState {
  const factory ClassifyState.idle() = _ClassifyStateIdle;
  const factory ClassifyState.loading({
    required XFile image,
  }) = _ClassifyStateLoading;
  const factory ClassifyState.success({
    required XFile image,
    required ClassifyResult value,
    required List<SimilarPerson> similarPeople,
  }) = _ClassifyStateSuccess;
  const factory ClassifyState.error(
    Object error, [
    StackTrace? st,
  ]) = _ClassifyStateError;
}

extension ClassifyStateX on ClassifyState {
  bool get isSuccess => this is _ClassifyStateSuccess;
}
