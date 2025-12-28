import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('More'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'Okurki App',
              style: CupertinoTheme.of(
                context,
              ).textTheme.navTitleTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              "App's version v0.1.0",
              style: CupertinoTheme.of(
                context,
              ).textTheme.navTitleTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
