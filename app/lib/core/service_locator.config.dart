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
import 'package:okurki_app/core/data/shared_prefs_module.dart' as _i321;
import 'package:okurki_app/core/network/auth/auth_service.dart' as _i326;
import 'package:okurki_app/core/network/auth/data/session_manager.dart'
    as _i276;
import 'package:okurki_app/core/network/auth/data/token_storage.dart' as _i419;
import 'package:okurki_app/core/network/auth/data/user_id_service.dart'
    as _i463;
import 'package:okurki_app/core/network/dio_service.dart' as _i37;
import 'package:okurki_app/features/classification/data/repo/classification_repo_mock.dart'
    as _i641;
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart'
    as _i60;
import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart'
    as _i705;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _test = 'test';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefsModule = _$SharedPrefsModule();
    final dioService = _$DioService();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.BaseOptions>(() => dioService.baseOptions);
    gh.lazySingleton<_i419.TokenStorage>(
      () => _i419.TokenStorage(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i463.UserIDService>(
      () => _i463.UserIDService(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i60.ClassificationRepo>(
      () => _i641.ClassificationRepoMock(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioService.dioAuth(),
      instanceName: 'DioAuth',
    );
    gh.lazySingleton<_i276.SessionManager>(
      () => _i276.SessionManager(gh<_i419.TokenStorage>()),
    );
    gh.singleton<_i326.AuthService>(
      () => _i326.AuthService(
        gh<_i361.Dio>(instanceName: 'DioAuth'),
        gh<_i463.UserIDService>(),
        gh<_i276.SessionManager>(),
      ),
    );
    gh.lazySingleton<_i37.AuthInterceptor>(
      () => _i37.AuthInterceptor(
        gh<_i276.SessionManager>(),
        gh<_i326.AuthService>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioService.dioApi(
        gh<_i37.AuthInterceptor>(),
        gh<_i361.BaseOptions>(),
      ),
      instanceName: 'DioApi',
    );
    gh.singleton<_i60.ClassificationRepo>(
      () => _i60.ClassificationRepoImpl(gh<_i361.Dio>(instanceName: 'DioApi')),
      registerFor: {_dev},
    );
    gh.factory<_i705.ClassifyCubit>(
      () => _i705.ClassifyCubit(repo: gh<_i60.ClassificationRepo>()),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i321.SharedPrefsModule {}

class _$DioService extends _i37.DioService {}
