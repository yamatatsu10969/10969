/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering

import 'package:flutter/widgets.dart';

class $AssetsLauncherIconsGen {
  const $AssetsLauncherIconsGen();

  $AssetsLauncherIconsAdaptiveGen get adaptive =>
      const $AssetsLauncherIconsAdaptiveGen();

  /// File path: assets/launcher_icons/icon-dev.png
  AssetGenImage get iconDev =>
      const AssetGenImage('assets/launcher_icons/icon-dev.png');

  /// File path: assets/launcher_icons/icon-prod.png
  AssetGenImage get iconProd =>
      const AssetGenImage('assets/launcher_icons/icon-prod.png');

  /// File path: assets/launcher_icons/icon-stg.png
  AssetGenImage get iconStg =>
      const AssetGenImage('assets/launcher_icons/icon-stg.png');
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/oneokrock_icon.jpeg
  AssetGenImage get oneokrockIcon =>
      const AssetGenImage('assets/logos/oneokrock_icon.jpeg');

  /// File path: assets/logos/oneokrock_logo.png
  AssetGenImage get oneokrockLogo =>
      const AssetGenImage('assets/logos/oneokrock_logo.png');
}

class $AssetsProfilesGen {
  const $AssetsProfilesGen();

  /// File path: assets/profiles/ryota.jpg
  AssetGenImage get ryota => const AssetGenImage('assets/profiles/ryota.jpg');

  /// File path: assets/profiles/taka.jpg
  AssetGenImage get taka => const AssetGenImage('assets/profiles/taka.jpg');

  /// File path: assets/profiles/tomoya.jpg
  AssetGenImage get tomoya => const AssetGenImage('assets/profiles/tomoya.jpg');

  /// File path: assets/profiles/toru.jpg
  AssetGenImage get toru => const AssetGenImage('assets/profiles/toru.jpg');
}

class $AssetsLauncherIconsAdaptiveGen {
  const $AssetsLauncherIconsAdaptiveGen();

  /// File path: assets/launcher_icons/adaptive/adaptive-icon-dev.png
  AssetGenImage get adaptiveIconDev => const AssetGenImage(
      'assets/launcher_icons/adaptive/adaptive-icon-dev.png');

  /// File path: assets/launcher_icons/adaptive/adaptive-icon-prod.png
  AssetGenImage get adaptiveIconProd => const AssetGenImage(
      'assets/launcher_icons/adaptive/adaptive-icon-prod.png');

  /// File path: assets/launcher_icons/adaptive/adaptive-icon-stg.png
  AssetGenImage get adaptiveIconStg => const AssetGenImage(
      'assets/launcher_icons/adaptive/adaptive-icon-stg.png');
}

class Assets {
  Assets._();

  static const $AssetsLauncherIconsGen launcherIcons =
      $AssetsLauncherIconsGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
  static const $AssetsProfilesGen profiles = $AssetsProfilesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
