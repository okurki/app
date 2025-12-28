import 'package:image_picker/image_picker.dart';
import 'package:okurki_app/features/classification/domain/repo/image_picker_repo.dart';

class ImagePickerAdapter implements ImagePickerRepo {
  ImagePickerAdapter(ImagePicker picker) : _picker = picker;

  final ImagePicker _picker;

  @override
  Future<XFile?> pickImageCamera() async {
    return _picker.pickImage(source: ImageSource.camera);
  }

  @override
  Future<XFile?> pickImageGallery() {
    return _picker.pickImage(source: ImageSource.gallery);
  }
}
