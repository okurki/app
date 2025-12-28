import 'package:image_picker/image_picker.dart';

abstract interface class ImagePickerRepo {
  Future<XFile?> pickImageCamera();
  Future<XFile?> pickImageGallery();
}
