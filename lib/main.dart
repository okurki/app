import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/cupertino.dart';
import 'package:okurki_app/core/app.dart';
import 'package:okurki_app/core/service_locator.dart';
import 'package:okurki_app/telegram/telegram_web_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();

  if (kIsWeb) {
    TelegramWebApp.ready();
  }

  runApp(const MyApp());
}
