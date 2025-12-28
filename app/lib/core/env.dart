class Env {
  static String get baseUrl => const String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'wrong.api.lol:228'
  );
}
