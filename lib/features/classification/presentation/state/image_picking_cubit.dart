import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okurki_app/features/classification/domain/repo/image_picker_repo.dart';

part 'image_picking_state.dart';
part 'image_picking_cubit.freezed.dart';

class ImagePickingCubit extends Cubit<ImagePickingState> {
  ImagePickingCubit({required ImagePickerRepo repo})
    : _pickerRepo = repo,
      super(const ImagePickingState.idle());

  final ImagePickerRepo _pickerRepo;

  Future<void> pickPictureCamera() async {
    // Avoid races.
    if (state case ImagePickingStatePicked(
      :final imageStatus,
    ) when imageStatus == ImageLoadingStatus.imageLoading) {
      return;
    }

    final file = await _pickerRepo.pickImageCamera();
    if (file == null) return;
    emit(ImagePickingState.imagePicked(pickedFile: file));
  }

  Future<void> pickPictureGallery() async {
    // Avoid races.
    if (state case ImagePickingStatePicked(
      :final imageStatus,
    ) when imageStatus == ImageLoadingStatus.imageLoading) {
      return;
    }

    final file = await _pickerRepo.pickImageGallery();
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
