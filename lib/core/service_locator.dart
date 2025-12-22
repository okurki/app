import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:okurki_app/core/service_locator.config.dart';
import 'package:okurki_app/features/classification/data/services/image_picker_adapter.dart';
import 'package:okurki_app/features/classification/domain/repo/image_picker_repo.dart';
import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart';
import 'package:okurki_app/features/classification/presentation/state/image_picking_cubit.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies({String? environment}) => getIt.init(
  environment: environment,
);

void registerDependencies([String? env]) {
  registerClassifyDependencies();
  configureDependencies(environment: env);
}

void registerClassifyDependencies() {
  getIt
    ..registerLazySingleton<ImagePicker>(ImagePicker.new)
    ..registerLazySingleton<ImagePickerRepo>(
      () => ImagePickerAdapter(ImagePicker()),
    )
    ..registerFactory(() => ImagePickingCubit(repo: getIt()))
    ..registerFactory(() => ClassifyCubit(repo: getIt()));
}
