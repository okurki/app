import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:okurki_app/core/service_locator.dart';
import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart';
import 'package:okurki_app/features/classification/presentation/state/image_picking_cubit.dart';
import 'package:okurki_app/features/classification/presentation/ui/image_picking_screen.dart';
import 'package:okurki_app/features/classification/presentation/ui/results_screen.dart';
import 'package:okurki_app/features/home/presentation/home.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/rate',
  observers: [HeroController()],
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return _ScaffoldWithNavBar(shell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            ShellRoute(
              builder: (context, state, child) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => getIt<ImagePickingCubit>()),
                    BlocProvider(create: (_) => getIt<ClassifyCubit>()),
                  ],
                  child: child,
                );
              },
              routes: [
                GoRoute(
                  path: '/rate',
                  builder: (context, state) => const ImagePickingScreen(),
                  routes: [
                    GoRoute(
                      path: 'results',
                      pageBuilder: (_, _) {
                        // return const CupertinoPage(child: ResultsScreen());
                        return CustomTransitionPage(
                          transitionDuration: const Duration(milliseconds: 400),
                          reverseTransitionDuration: const Duration(
                            milliseconds: 400,
                          ),
                          transitionsBuilder: (context, anim, _, child) {
                            return FadeTransition(opacity: anim, child: child);
                          },
                          child: const ResultsScreen(),
                        );
                      },
                    ),
                  ],
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
