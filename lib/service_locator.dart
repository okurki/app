import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerLazySingleton<ImagePicker>(ImagePicker.new);
}
