import 'package:flutter/cupertino.dart';
import 'package:okurki_app/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Image Classifier',
      routerConfig: router,
    );
  }
}
