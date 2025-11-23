import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okurki_app/features/classification/data/models/similar_person.dart';
import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart';

class SimilarPeopleScreen extends StatefulWidget {
  const SimilarPeopleScreen({super.key});

  @override
  State<SimilarPeopleScreen> createState() => _SimilarPeopleScreenState();
}

class _SimilarPeopleScreenState extends State<SimilarPeopleScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ClassifyCubit, ClassifyState, List<SimilarPerson>>(
      selector: (state) {
        return state.maybeMap(
          success: (value) => value.similarPeople,
          orElse: () => const [],
        );
      },
      builder: (context, celebs) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            automaticallyImplyLeading: false,
            middle: Text('Similar to you'),
          ),
          child: SafeArea(
            child: PageView(
              controller: _pageController,
              scrollDirection: .vertical,
              children: List.generate(
                celebs.length,
                (index) => SimilarPersonPage(
                  celebData: celebs[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SimilarPersonPage extends StatefulWidget {
  const SimilarPersonPage({required this.celebData, super.key});

  final SimilarPerson celebData;

  @override
  State<SimilarPersonPage> createState() => _SimilarPersonPageState();
}

class _SimilarPersonPageState extends State<SimilarPersonPage> {
  bool shouldBeRated = Random().nextBool();
  bool isRated = false;

  List<Widget> rateWidgets() {
    return [
      Text(
        'Rate this guess',
        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
          color: CupertinoColors.white,
        ),
      ),
      const SizedBox(height: 4),
      Row(
        children: [
          CupertinoButton.filled(
            sizeStyle: .small,
            child: const Icon(CupertinoIcons.hand_thumbsup_fill),
            onPressed: () {
              setState(() {
                isRated = true;
              });
            },
          ),
          const SizedBox(width: 8),
          CupertinoButton.filled(
            sizeStyle: .small,
            child: const Icon(CupertinoIcons.hand_thumbsdown_fill),
            onPressed: () {
              setState(() {
                isRated = true;
              });
            },
          ),
        ],
      ),
    ];
  }

  List<Widget> thanksForRateWidgets() {
    return [
      Text(
        'Thanks for the feedback!',
        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
          color: CupertinoColors.white,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: .expand,
      children: [
        Image.memory(
          widget.celebData.imgBytes,
          fit: .cover,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [CupertinoColors.black, CupertinoColors.transparent],
              ),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  padding: const .fromLTRB(16, 16, 16, 0),
                  child: Text(
                    widget.celebData.name,
                    style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle.copyWith(
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
                if (shouldBeRated)
                  Container(
                    padding: const .symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: isRated ? thanksForRateWidgets() : rateWidgets(),
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
