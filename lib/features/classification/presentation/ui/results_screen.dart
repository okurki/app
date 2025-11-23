import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart';
import 'package:okurki_app/features/classification/presentation/ui/classify_screen.dart';
import 'package:okurki_app/features/classification/presentation/ui/similar_people_screen.dart';

const int _kPagesAmount = 2;

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late final PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          success: (image, classifyResult, _) {
            return CupertinoPageScaffold(
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (value) {
                      setState(() => currentPage = value);
                    },
                    controller: _pageController,
                    children: [
                      ClassifyResultScreen(imagePath: image.path, classifyResult: classifyResult),
                      const SimilarPeopleScreen(),
                    ],
                  ),
                  Positioned(
                    bottom: 32,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        CurrentPageHighlighter(
                          currentPage: currentPage,
                          pagesAmount: _kPagesAmount,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
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
                                onPressed: () {
                                  context.read<ClassifyCubit>().reset();
                                  context.pop();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
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
                    Text(
                      'Something wrong happened',
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                    ),
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

class CurrentPageHighlighter extends StatelessWidget {
  const CurrentPageHighlighter({required this.currentPage, required this.pagesAmount, super.key});

  final int currentPage;
  final int pagesAmount;

  BoxDecoration _decorationForActive() {
    return BoxDecoration(
      color: CupertinoColors.activeBlue,
      borderRadius: BorderRadius.circular(100),
    );
  }

  BoxDecoration _decorationDefault(BuildContext context) {
    return BoxDecoration(
      color: CupertinoDynamicColor.resolve(CupertinoColors.lightBackgroundGray, context),
      borderRadius: BorderRadius.circular(100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: .center,
      children: List.generate(pagesAmount, (index) {
        return Container(
          width: 12,
          height: 12,
          decoration: index == currentPage ? _decorationForActive() : _decorationDefault(context),
        );
      }),
    );
  }
}
