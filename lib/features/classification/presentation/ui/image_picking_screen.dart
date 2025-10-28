import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:okurki_app/features/classification/presentation/state/classify_cubit.dart';
import 'package:okurki_app/features/classification/presentation/state/image_picking_cubit.dart';

const _kFadingDuration = Duration(milliseconds: 400);

class ImagePickingScreen extends StatelessWidget {
  const ImagePickingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClassifyCubit, ClassifyState>(
      listenWhen: (previous, current) {
        final shouldNavigate = !previous.isSuccess && current.isSuccess;
        return shouldNavigate;
      },
      listener: (context, state) async {
        await state.mapOrNull(
          success: (_) async {
            // Navigate.
            await context.push('/rate/results');

            // Reset blocs.
            if (!context.mounted) return;
            context.read<ImagePickingCubit>().reset();
            context.read<ClassifyCubit>().reset();
          },
        );
      },
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

  Widget _buildPlaceholder(
    BuildContext context, {
    required bool needsConstraints,
  }) {
    final child = CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        unawaited(
          context.read<ImagePickingCubit>().pickPictureCamera(),
        );
      },
      onLongPress: () async {
        unawaited(
          context.read<ImagePickingCubit>().pickPictureGallery(),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
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
      ),
    );

    if (!needsConstraints) return child;
 
    return AspectRatio(
      aspectRatio: 5 / 6,
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<ImagePickingCubit, ImagePickingState>(
        builder: (context, state) {
          return state.when(
            idle: () => _buildPlaceholder(context, needsConstraints: true),
            imagePicked: (pickedFile, status) => AspectRatio(
              aspectRatio: 5 / 6,
              child: Padding(
                padding: const EdgeInsetsGeometry.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    if (status != ImageLoadingStatus.imageLoaded)
                      _buildPlaceholder(context, needsConstraints: false),
                    Hero(
                      tag: 'Penis',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(pickedFile.path),
                          key: ValueKey(pickedFile.path),
                          fit: BoxFit.cover,
                          frameBuilder: (context, child, frame, wasSync) {
                            if (wasSync) return child;
                            final loaded = frame != null;
                            if (loaded) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                context
                                    .read<ImagePickingCubit>()
                                    .notifyPictureWasLoaded();
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
                              context
                                  .read<ImagePickingCubit>()
                                  .notifyPictureError(
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
                                        color:
                                            CupertinoColors.lightBackgroundGray,
                                        darkColor:
                                            CupertinoColors.darkBackgroundGray,
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
                        ),
                      ),
                    ),
                    _ImageOverlayButton(status),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ImageOverlayButton extends StatelessWidget {
  const _ImageOverlayButton(this.status);

  final ImageLoadingStatus status;

  @override
  Widget build(BuildContext context) {
    final s = status;
    if (s == ImageLoadingStatus.imageLoading) return const SizedBox.shrink();

    return BlocBuilder<ClassifyCubit, ClassifyState>(
      buildWhen: (previous, current) {
        return !previous.isSuccess && current.isSuccess;
      },
      builder: (context, state) {
        if (state.isSuccess) return const SizedBox.shrink();

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
                child: switch (s) {
                  ImageLoadingStatus.imageLoaded => const Text('Remove'),
                  ImageLoadingStatus.imageErrored => const Text('Try again'),
                  // Impossible state, but compiler complains.
                  ImageLoadingStatus.imageLoading => const Text('Try again'),
                },
                onPressed: () {
                  context.read<ImagePickingCubit>().removePickedPicture();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  Widget _buildFor(BuildContext context, ImagePickingState state) {
    if (state case ImagePickingStatePicked(
      :final imageStatus,
      :final pickedFile,
    ) when imageStatus == ImageLoadingStatus.imageLoaded) {
      return Column(
        key: const ValueKey('Ready'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          BlocBuilder<ClassifyCubit, ClassifyState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: (_) => CupertinoButton.filled(
                  onPressed: () {},
                  child: const CupertinoActivityIndicator(
                    color: CupertinoColors.white,
                  ),
                ),
                success: (image, value) {
                  // This trick allows smooth animation for hero.
                  return Hero(
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
                      onPressed: () {},
                    ),
                  );
                },
                orElse: () => CupertinoButton.filled(
                  onPressed: () async {
                    await context.read<ClassifyCubit>().classify(
                      pickedFile,
                    );
                  },
                  child: const Text('Send'),
                ),
              );
            },
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
            child: Hero(
              tag: 'Pizda',
              child: CupertinoButton.filled(
                onPressed: () {
                  unawaited(
                    context.read<ImagePickingCubit>().pickPictureCamera(),
                  );
                },
                child: const Text('Take a photo'),
              ),
            ),
          ),
          CupertinoButton(
            onPressed: () async {
              unawaited(
                context.read<ImagePickingCubit>().pickPictureGallery(),
              );
            },
            child: const Text('Choose from library'),
          ),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickingCubit, ImagePickingState>(
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
