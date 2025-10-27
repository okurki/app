import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:okurki_app/features/classification/data/repo/classification_repo_mock.dart';
import 'package:okurki_app/features/classification/data/services/image_picker_adapter.dart';
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart';
import 'package:okurki_app/features/classification/domain/repo/image_picker_repo.dart';
import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart';
import 'package:okurki_app/features/classification/presentation/state/image_picking_cubit.dart';

final GetIt getIt = GetIt.instance;

void registerDependencies() {
  registerClassifyDependencies();
}

void registerClassifyDependencies() {
  getIt
    ..registerLazySingleton<ImagePicker>(ImagePicker.new)
    ..registerLazySingleton<ClassificationRepo>(ClassificationRepoMock.new)
    ..registerLazySingleton<ImagePickerRepo>(
      () => ImagePickerAdapter(ImagePicker()),
    )
    ..registerFactory(() => ImagePickingCubit(repo: getIt()))
    ..registerFactory(() => ClassifyCubit(repo: getIt()));
}
