import 'package:flutter/cupertino.dart';
import 'package:okurki_app/core/app.dart';
import 'package:okurki_app/core/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();
  runApp(const MyApp());
}
