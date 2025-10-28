import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassifyCubit, ClassifyState>(
      buildWhen: (previous, current) {
        // We do not want to build when clearing bloc.
        // This means transitioning `success` -> `idle`
        final blocJustCleared = previous.isSuccess && !current.isSuccess;
        return !blocJustCleared;
      },
      builder: (context, state) {
        return state.maybeWhen(
          success: (image, value) {
            return CupertinoPageScaffold(
              child: Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      const CupertinoSliverNavigationBar(
                        automaticallyImplyLeading: false,
                        largeTitle: Padding(
                          padding: EdgeInsetsGeometry.only(right: 16),
                          child: Center(child: Text('Result')),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsetsGeometry.fromLTRB(
                            32,
                            6,
                            32,
                            0,
                          ),
                          child: Hero(
                            tag: 'Penis',
                            child: AspectRatio(
                              aspectRatio: 5 / 6,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(12),
                                child: Image.file(
                                  File(image.path),
                                  key: ValueKey(image.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsetsGeometry.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          child: Center(
                            child: Text(
                              'Pretty Fucking Good',
                              style:
                                  CupertinoTheme.of(
                                    context,
                                  ).textTheme.navLargeTitleTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 48,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsetsGeometry.symmetric(
                        horizontal: 16,
                      ),
                      child: Hero(
                        tag: 'Pizda',
                        child: CupertinoButton.filled(
                          color: CupertinoDynamicColor.resolve(
                            const CupertinoDynamicColor.withBrightness(
                              color: CupertinoColors.extraLightBackgroundGray,
                              darkColor: CupertinoColors.darkBackgroundGray,
                            ),
                            context,
                          ),
                          child: Text(
                            'New photo',
                            style: const TextStyle().copyWith(
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                          onPressed: () => context.pop(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: () {
            return CupertinoPageScaffold(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Something wrong happened'),
                    CupertinoButton(
                      child: const Text('Try again'),
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
