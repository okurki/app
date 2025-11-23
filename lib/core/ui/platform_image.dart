import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformImage extends StatelessWidget {
  const PlatformImage({
    required this.path,
    super.key,
    this.fit,
    this.width,
    this.height,
    this.frameBuilder,
    this.errorBuilder,
  });

  final String path;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final ImageFrameBuilder? frameBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(
        path,
        key: key,
        fit: fit,
        width: width,
        height: height,
        frameBuilder: frameBuilder,
        errorBuilder: errorBuilder,
      );
    }

    return Image.file(
      File(path),
      key: key,
      fit: fit,
      width: width,
      height: height,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
    );
  }
}
