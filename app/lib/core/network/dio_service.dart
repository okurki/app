import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:okurki_app/core/env.dart';
import 'package:okurki_app/core/network/auth/auth_service.dart';
import 'package:okurki_app/core/network/auth/data/session_manager.dart';

@module
abstract class DioService {
  @lazySingleton
  BaseOptions get baseOptions => BaseOptions(baseUrl: Env.baseUrl);

  @lazySingleton
  @Named('DioAuth')
  Dio dioAuth() => Dio(baseOptions);

  @lazySingleton
  @Named('DioApi')
  Dio dioApi(AuthInterceptor authInterceptor, BaseOptions baseOptions) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}

@lazySingleton
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._session, this._authService);

  final SessionManager _session;
  final AuthService _authService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = _session.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Reauth
      await _authService.ensureSignedIn();

      // Option B (better): refresh token once, then retry
      // (Implement refresh lock to avoid multiple refresh calls)
    }
    handler.next(err);
  }
}
