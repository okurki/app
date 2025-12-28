import 'package:injectable/injectable.dart';
import 'package:okurki_app/core/network/auth/data/token_storage.dart';

@lazySingleton
class SessionManager {
  SessionManager(
    TokenStorage tokenStorage,
  ) : _storage = tokenStorage;

  final TokenStorage _storage;

  String? getAccessToken() => _storage.readAccessToken();

  Future<bool> setAccessToken(String token) => _storage.writeAccessToken(token);

  Future<bool> logout() => _storage.clear();
}
