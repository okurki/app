import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:okurki_app/features/classification/presentation/ui/classify_screen.dart';
import 'package:okurki_app/features/classification/presentation/ui/results_screen.dart';
import 'package:okurki_app/features/home/presentation/home.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// final x = [
//   // The route branch for the first tab of the bottom navigation bar.
//   StatefulShellBranch(
//     navigatorKey: _sectionANavigatorKey,
//     routes: <RouteBase>[
//       GoRoute(
//         // The screen to display as the root in the first tab of the
//         // bottom navigation bar.
//         path: '/a',
//         builder: (BuildContext context, GoRouterState state) =>
//             const RootScreen(label: 'A', detailsPath: '/a/details'),
//         routes: <RouteBase>[
//           // The details screen to display stacked on navigator of the
//           // first tab. This will cover screen A but not the application
//           // shell (bottom navigation bar).
//           GoRoute(
//             path: 'details',
//             builder: (BuildContext context, GoRouterState state) =>
//                 const DetailsScreen(label: 'A'),
//           ),
//         ],
//       ),
//     ],
//     // To enable preloading of the initial locations of branches, pass
//     // 'true' for the parameter `preload` (false is default).
//   ),
// ];

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/rate',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return _ScaffoldWithNavBar(shell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/rate',
              builder: (context, state) {
                return const ClassifyScreen();
              },
              routes: [
                GoRoute(
                  path: 'results',
                  builder: (context, state) => const ResultsScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class _ScaffoldWithNavBar extends StatelessWidget {
  const _ScaffoldWithNavBar({required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_circle_fill),
            label: 'Rate',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
        onTap: shell.goBranch,
        currentIndex: shell.currentIndex,
      ),
      body: shell,
    );
  }
}
