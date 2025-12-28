import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class TokenStorage {
  TokenStorage(SharedPreferences prefs) : _prefs = prefs;

  final SharedPreferences _prefs;

  static String get tokenKey => 'token';

  String? readAccessToken() => _prefs.getString(tokenKey);

  Future<bool> writeAccessToken(String token) => _prefs.setString(tokenKey, token);

  Future<bool> clear() => _prefs.remove(tokenKey);
}
