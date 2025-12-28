import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/v4.dart';

@singleton
class UserIDService {
  UserIDService(SharedPreferences prefs) : _prefs = prefs;

  final SharedPreferences _prefs;

  String? _name;

  static String get userIDKey => 'user_id';

  String detectName(String name) => _name ??= name;

  Future<void> removeUI() => _prefs.remove(userIDKey);

  String getOrCreateUUID() {
    final cached = _prefs.getString(userIDKey);
    if (cached == null) {
      final uuid = _generateID();
      unawaited(_prefs.setString(userIDKey, uuid));
      return uuid;
    }
    return cached;
  }

  String _generateID() {
    if (_name != null) return 'tg_$_name';

    const uuid = UuidV4();
    return 'mobile_${uuid.generate().substring(0, 15)}';
  }
}
