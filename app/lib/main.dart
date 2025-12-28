import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:okurki_app/core/app.dart';
import 'package:okurki_app/core/network/auth/auth_service.dart';
import 'package:okurki_app/core/service_locator.dart';
import 'package:okurki_app/core/telegram/telegram_web_app.dart';
import 'package:okurki_app/core/web/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies(Environment.dev);

  await getIt<AuthService>().ensureSignedIn();

  // const file = r'/Users/chabanovz/Library/Developer/CoreSimulator/Devices/A71579C9-2CD4-4854-9B81-2D0435A8DEE6/data/Containers/Data/Application/AEBE03DA-1969-47FB-9BA5-CB925CEFCE91/tmp/image_picker_384E500D-1B04-4D2D-8536-F15B0F53ABED-73819-00000CF578FE1C6E.jpg';
  // await getIt<ClassificationRepo>().classify(XFile(file));

  configureUrlStrategy();
  TelegramWebApp.ready();

  runApp(const MyApp());
}
