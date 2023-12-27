/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

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

  /// List of all assets
  List<AssetGenImage> get values => [iconDev, iconProd, iconStg];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/oneokrock_icon.jpeg
  AssetGenImage get oneokrockIcon =>
      const AssetGenImage('assets/logos/oneokrock_icon.jpeg');

  /// File path: assets/logos/oneokrock_logo.png
  AssetGenImage get oneokrockLogo =>
      const AssetGenImage('assets/logos/oneokrock_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [oneokrockIcon, oneokrockLogo];
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

  /// List of all assets
  List<AssetGenImage> get values => [ryota, taka, tomoya, toru];
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

  /// List of all assets
  List<AssetGenImage> get values =>
      [adaptiveIconDev, adaptiveIconProd, adaptiveIconStg];
}

class Assets {
  Assets._();

  static const $AssetsLauncherIconsGen launcherIcons =
      $AssetsLauncherIconsGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
  static const $AssetsProfilesGen profiles = $AssetsProfilesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
