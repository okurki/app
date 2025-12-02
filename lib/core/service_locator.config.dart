// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:okurki_app/core/network/dio_service.dart' as _i37;
import 'package:okurki_app/features/classification/data/repo/classification_repo_mock.dart'
    as _i641;
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart'
    as _i60;

const String _test = 'test';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioService = _$DioService();
    gh.lazySingleton<_i361.Dio>(() => dioService.dio);
    gh.singleton<_i60.ClassificationRepo>(
      () => _i641.ClassificationRepoMock(),
      registerFor: {_test},
    );
    gh.singleton<_i60.ClassificationRepo>(
      () => _i60.ClassificationRepoImpl(gh<_i361.Dio>()),
      registerFor: {_dev},
    );
    return this;
  }
}

class _$DioService extends _i37.DioService {}
