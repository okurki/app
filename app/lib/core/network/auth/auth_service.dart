import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:okurki_app/core/logger.dart';
import 'package:okurki_app/core/network/auth/data/session_manager.dart';
import 'package:okurki_app/core/network/auth/data/user_id_service.dart';

@singleton
class AuthService {
  AuthService(
    @Named('DioAuth') Dio dio,
    UserIDService userIDService,
    SessionManager sessionManager,
  ) : _dio = dio,
      _userIDService = userIDService,
      _sessionManager = sessionManager;

  final Dio _dio;

  final UserIDService _userIDService;

  final SessionManager _sessionManager;

  Future<void> ensureSignedIn() async {
    logger.t('Trying to log in...');
    final loginResult = await _login();

    if (loginResult != null) {
      await _sessionManager.setAccessToken(loginResult);
      logger.t('Successfully logged in.');
      return;
    }

    logger.t('Trying to register...');
    final registerResult = await _register();
    if (registerResult != null) {
      await _sessionManager.setAccessToken(registerResult);
      logger.t('Successfully registered.');
      return;
    }

    logger.f('Something wrong with getting the token');
  }

  Future<String?> _login() async {
    try {
      final result = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: {'name': _userIDService.getOrCreateUUID(), 'password': 'password'},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      logger.t(result);
      if (result.statusCode != 200) return null;
      if (result.data == null && result.data!['token'] == null) {
        logger.e('WTF with backend login?');
        return null;
      }
      return result.data!['token'] as String;
    } on DioException catch (_) {
      // logger.e(e);
      return null;
    }
  }

  Future<String?> _register() async {
    try {
      final result = await _dio.post<Map<String, dynamic>>(
        '/auth/register',
        data: {'name': _userIDService.getOrCreateUUID(), 'password': 'password'},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (result.statusCode != 200) return null;
      if (result.data == null && result.data!['token'] == null) {
        logger.e('WTF with backend register?');
        return null;
      }
      return result.data!['token'] as String;
    } on DioException catch (_) {
      // logger.e(e);
      return null;
    }
  }
}
