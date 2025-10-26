import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picking_state.dart';
part 'image_picking_cubit.freezed.dart';

class ImagePickingCubit extends Cubit<ImagePickingState> {
  ImagePickingCubit() : super(const ImagePickingState.idle());

  void pickPicture(XFile? file) {
    if (file == null) return;
    emit(ImagePickingState.imagePicked(pickedFile: file));
  }

  void notifyPictureWasLoaded() {
    final s = state;
    if (s is! ImagePickingStatePicked) return;
    emit(s.copyWith(imageStatus: ImageLoadingStatus.imageLoaded));
  }

  void notifyPictureError(Object error, StackTrace? st) {
    final s = state;
    if (s is! ImagePickingStatePicked) return;
    emit(s.copyWith(imageStatus: ImageLoadingStatus.imageErrored));
  }

  void removePickedPicture() {
    emit(const ImagePickingState.idle());
  }
}
