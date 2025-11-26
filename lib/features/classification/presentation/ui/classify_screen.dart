import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:okurki_app/core/ui/platform_image.dart';
import 'package:okurki_app/features/classification/data/models/classify_result.dart';
import 'package:okurki_app/telegram/telegram_web_app.dart';

class ClassifyResultScreen extends StatelessWidget {
  const ClassifyResultScreen({required this.classifyResult, required this.imagePath, super.key});

  final String imagePath;
  final ClassifyResult classifyResult;

  String getTitle() {
    final p = classifyResult.prediction;

    final title = switch (p) {
      > 0 && < 0.15 => 'Ugly',
      >= 0.15 && < 0.3 => 'Below Average',
      >= 0.3 && < 0.5 => 'Meh',
      >= 0.5 && < 0.7 => 'Decent',
      >= 0.7 && < 0.85 => 'Attractive',
      >= 0.85 && <= 1.0 => 'Sexy Beast',
      _ => 'Unknown', // because prediction is apparently a free spirit
    };

    return '$title (${(p * 100).toInt()}%)';
  }

  String getDetailedDescription() {
    final p = classifyResult.prediction;

    return switch (p) {
      > 0 && < 0.15 =>
        'Apparently, you are not the best-looking person. A tough rating, but hey—there’s always lighting, angles, and personality.',
      >= 0.15 && < 0.3 =>
        'It seems you’re below average in this particular rating. Not great, not terrible—just a bit unlucky today.',
      >= 0.3 && < 0.5 => 'You fall into the middle zone. Nothing striking, nothing off-putting—solidly neutral.',
      >= 0.5 && < 0.7 => 'A decent appearance! Clearly some appealing features, even if not fully polished.',
      >= 0.7 && < 0.85 => 'You look attractive. Strong features, pleasant proportions, and generally appealing.',
      >= 0.85 && <= 1.0 =>
        'You’re rated extremely highly—great symmetry, strong visual appeal, and overall excellent aesthetics.',
      _ => 'No description available. The prediction value was out of the expected range.',
    };
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                  child: PlatformImage(
                    path: imagePath,
                    key: ValueKey(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const .symmetric(horizontal: 32),
            child: Center(
              child: Text(
                getTitle(),
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
        const SliverToBoxAdapter(child: SizedBox(height: 4)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const .symmetric(horizontal: 32),
            child: Center(
              child: Text(
                getDetailedDescription(),
                textAlign: .center,
                style:
                    CupertinoTheme.of(
                      context,
                    ).textTheme.tabLabelTextStyle.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
          ),
        ),
        if (kIsWeb) ...[
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    color: CupertinoColors.activeGreen,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: const Text('Like'),
                    onPressed: () {
                      TelegramWebApp.sendData({
                        'event': 'rate_guess',
                        'value': 'like',
                        'prediction': classifyResult.prediction,
                      });
                    },
                  ),
                  CupertinoButton(
                    color: CupertinoColors.destructiveRed,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: const Text('Dislike'),
                    onPressed: () {
                      TelegramWebApp.sendData({
                        'event': 'rate_guess',
                        'value': 'dislike',
                        'prediction': classifyResult.prediction,
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
