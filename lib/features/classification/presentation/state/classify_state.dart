part of 'classify_cubit.dart';

@freezed
sealed class ClassifyState with _$ClassifyState {
  const factory ClassifyState.idle() = _ClassifyStateIdle;
  const factory ClassifyState.loading() = _ClassifyStateLoading;
  const factory ClassifyState.success({
    required ClassifyResult value,
  }) = _ClassifyStateSuccess;
  const factory ClassifyState.error(
    Object error, [
    StackTrace? st,
  ]) = _ClassifyStateError;
}
