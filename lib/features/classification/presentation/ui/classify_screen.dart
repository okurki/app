import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okurki_app/features/classification/domain/repo/classification_repo.dart';
import 'package:okurki_app/features/classification/domain/repo/image_picker_repo.dart';
import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart';

import 'package:okurki_app/features/classification/presentation/state/image_picking_cubit.dart';
import 'package:okurki_app/service_locator.dart';

const _kFadingDuration = Duration(milliseconds: 400);

class ClassifyScreen extends StatelessWidget {
  const ClassifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImagePickingCubit(
            repo: getIt<ImagePickerRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => ClassifyCubit(
            repo: getIt<ClassificationRepo>(),
          ),
        ),
      ],
      child: const CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            _NavBar(),
            _PictureContainer(),
            _ActionButtons(),
          ],
        ),
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar();

  @override
  Widget build(BuildContext context) {
    return const CupertinoSliverNavigationBar(
      largeTitle: Text('New Rate'),
    );
  }
}

class _PictureContainer extends StatelessWidget {
  const _PictureContainer();

  Widget _buildPlaceholder(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        unawaited(context.read<ImagePickingCubit>().pickPictureCamera());
      },
      onLongPress: () async {
        unawaited(context.read<ImagePickingCubit>().pickPictureGallery());
      },
      child: Container(
        width: double.infinity,
        color: CupertinoDynamicColor.resolve(
          const CupertinoDynamicColor.withBrightness(
            color: CupertinoColors.lightBackgroundGray,
            darkColor: CupertinoColors.darkBackgroundGray,
          ),
          context,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            const Icon(
              CupertinoIcons.camera_fill,
              color: CupertinoColors.inactiveGray,
              size: 82,
            ),
            Text(
              'Add a photo to rate',
              style: CupertinoTheme.of(
                context,
              ).textTheme.tabLabelTextStyle.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return BlocBuilder<ImagePickingCubit, ImagePickingState>(
      builder: (context, state) {
        return state.maybeWhen(
          imagePicked: (pickedFile, _) {
            return Image.file(
              File(pickedFile.path),
              key: ValueKey(pickedFile.path),
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, wasSync) {
                if (wasSync) return child;
                final loaded = frame != null;
                if (loaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.read<ImagePickingCubit>().notifyPictureWasLoaded();
                  });
                }
                // Happy-path.
                return AnimatedOpacity(
                  opacity: loaded ? 1 : 0,
                  duration: _kFadingDuration,
                  child: child,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                // We notify about error here and draw
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.read<ImagePickingCubit>().notifyPictureError(
                    error,
                    stackTrace,
                  );
                });
                // Sad-path.
                return TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: _kFadingDuration,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: ColoredBox(
                        color: CupertinoDynamicColor.resolve(
                          const CupertinoDynamicColor.withBrightness(
                            color: CupertinoColors.lightBackgroundGray,
                            darkColor: CupertinoColors.darkBackgroundGray,
                          ),
                          context,
                        ),
                        child: Center(
                          child: Text(
                            'Could not load the image',
                            style: CupertinoTheme.of(
                              context,
                            ).textTheme.navTitleTextStyle,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildOverlayButton(BuildContext context) {
    return BlocBuilder<ImagePickingCubit, ImagePickingState>(
      builder: (context, state) {
        return state.maybeWhen(
          imagePicked: (_, imageStatus) {
            if (imageStatus == ImageLoadingStatus.imageLoading) {
              return const SizedBox.shrink();
            }

            return Positioned(
              top: 8,
              right: 8,
              child: TweenAnimationBuilder(
                duration: _kFadingDuration,
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) => Opacity(
                  opacity: value,
                  child: CupertinoButton.filled(
                    color: CupertinoColors.systemGrey4.withAlpha(220),
                    foregroundColor: CupertinoColors.black,
                    child: switch (imageStatus) {
                      ImageLoadingStatus.imageLoaded => const Text('Remove'),
                      ImageLoadingStatus.imageErrored => const Text(
                        'Try again',
                      ),
                      _ => const Text('Try again'),
                    },
                    onPressed: () {
                      context.read<ImagePickingCubit>().removePickedPicture();
                    },
                  ),
                ),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildPicture(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        _buildImage(context),
        _buildOverlayButton(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 5 / 6,
        child: Container(
          margin: const EdgeInsetsGeometry.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentGeometry.center,
            children: [
              _buildPlaceholder(context),
              _buildPicture(context),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  Widget _buildFor(BuildContext context, ImagePickingState state) {
    final s = state;
    if (s is ImagePickingStatePicked &&
        s.imageStatus == ImageLoadingStatus.imageLoaded) {
      return Column(
        key: const ValueKey('Ready'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          CupertinoButton.filled(
            onPressed: () {},
            child: const Text('Send'),
          ),
          Center(
            child: Text(
              'Pictures are processed securely',
              style: CupertinoTheme.of(
                context,
              ).textTheme.tabLabelTextStyle.copyWith(fontSize: 14),
            ),
          ),
        ],
      );
    }

    return Column(
      key: const ValueKey('idle'),
      children: [
        SizedBox(
          width: double.infinity,
          child: CupertinoButton.filled(
            onPressed: () {
              unawaited(context.read<ImagePickingCubit>().pickPictureCamera());
            },
            child: const Text('Take a photo'),
          ),
        ),
        CupertinoButton(
          onPressed: () async {
            unawaited(context.read<ImagePickingCubit>().pickPictureGallery());
          },
          child: const Text('Choose from library'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickingCubit, ImagePickingState>(
      // Any state change'd reflect.
      buildWhen: (a, b) => true,
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Container(
            height: 132,
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            child: AnimatedSwitcher(
              duration: _kFadingDuration,
              child: _buildFor(context, state),
            ),
          ),
        );
      },
    );
  }
}
