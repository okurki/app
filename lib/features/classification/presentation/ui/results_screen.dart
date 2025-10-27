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
      builder: (context, state) {
        return state.maybeWhen(
          success: (image, value) {
            return CupertinoPageScaffold(
              child: CustomScrollView(
                slivers: [
                  const CupertinoSliverNavigationBar(
                    automaticallyImplyLeading: false,
                    largeTitle: Padding(
                      padding: EdgeInsetsGeometry.only(right: 16),
                      child: Center(child: Text('Result')),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Hero(
                      tag: 'Pizdec',
                      child: Padding(
                        padding: const EdgeInsetsGeometry.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsetsGeometry.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          child: AspectRatio(
                            aspectRatio: 5 / 6,
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
                      padding: const EdgeInsetsGeometry.symmetric(vertical: 8),
                      child: Center(
                        child: Text(
                          '${value.prediction}',
                          style: CupertinoTheme.of(
                            context,
                          ).textTheme.navLargeTitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsetsGeometry.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      child: CupertinoButton.filled(
                        child: const Text('New photo'),
                        onPressed: () {
                          context.pop();
                        },
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
