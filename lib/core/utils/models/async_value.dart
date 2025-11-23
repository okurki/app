import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_value.freezed.dart';

@freezed
sealed class AsyncValue<T> with _$AsyncValue<T> {
  const factory AsyncValue.idle() = AsyncValueIdle<T>;
  const factory AsyncValue.loading() = AsyncValueLoading<T>;
  const factory AsyncValue.success(T value) = AsyncValueSuccess<T>;
  const factory AsyncValue.error(Object error, [StackTrace? st]) =
      AsyncValueError<T>;
}
