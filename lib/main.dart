import 'package:flutter/cupertino.dart';
import 'package:okurki_app/app.dart';
import 'package:okurki_app/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerDependencies();
  runApp(const MyApp());
}
