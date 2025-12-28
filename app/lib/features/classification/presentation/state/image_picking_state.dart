part of 'image_picking_cubit.dart';

enum ImageLoadingStatus { imageLoading, imageLoaded, imageErrored }

@freezed
sealed class ImagePickingState with _$ImagePickingState {
  const factory ImagePickingState.idle() = ImagePickingStateIdle;
  const factory ImagePickingState.imagePicked({
    required XFile pickedFile,
    @Default(ImageLoadingStatus.imageLoading) ImageLoadingStatus imageStatus,
  }) = ImagePickingStatePicked;
}
