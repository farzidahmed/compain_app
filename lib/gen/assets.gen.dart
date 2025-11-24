/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Inter.ttf
  String get inter => 'assets/fonts/Inter.ttf';

  /// File path: assets/fonts/mina.ttf
  String get mina => 'assets/fonts/mina.ttf';

  /// File path: assets/fonts/sfPro.ttf
  String get sfPro => 'assets/fonts/sfPro.ttf';

  /// List of all assets
  List<String> get values => [inter, mina, sfPro];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/about.svg
  String get about => 'assets/icons/about.svg';

  /// File path: assets/icons/albums2.svg
  String get albums2 => 'assets/icons/albums2.svg';

  /// File path: assets/icons/bnp_album.svg
  String get bnpAlbum => 'assets/icons/bnp_album.svg';

  /// File path: assets/icons/confirm_icon.svg
  String get confirmIcon => 'assets/icons/confirm_icon.svg';

  /// File path: assets/icons/contact.svg
  String get contact => 'assets/icons/contact.svg';

  /// File path: assets/icons/eye_close.svg
  String get eyeClose => 'assets/icons/eye_close.svg';

  /// File path: assets/icons/facebook.svg
  String get facebook => 'assets/icons/facebook.svg';

  /// File path: assets/icons/google_icon (6).svg
  String get googleIcon6 => 'assets/icons/google_icon (6).svg';

  /// File path: assets/icons/info.svg
  String get info => 'assets/icons/info.svg';

  /// File path: assets/icons/instra.svg
  String get instra => 'assets/icons/instra.svg';

  /// File path: assets/icons/logout.svg
  String get logout => 'assets/icons/logout.svg';

  /// File path: assets/icons/money_exchange.svg
  String get moneyExchange => 'assets/icons/money_exchange.svg';

  /// File path: assets/icons/twiter.svg
  String get twiter => 'assets/icons/twiter.svg';

  /// File path: assets/icons/warning_icons.svg
  String get warningIcons => 'assets/icons/warning_icons.svg';

  /// File path: assets/icons/web.svg
  String get web => 'assets/icons/web.svg';

  /// File path: assets/icons/whatsapp.svg
  String get whatsapp => 'assets/icons/whatsapp.svg';

  /// File path: assets/icons/youtube.svg
  String get youtube => 'assets/icons/youtube.svg';

  /// List of all assets
  List<String> get values => [
        about,
        albums2,
        bnpAlbum,
        confirmIcon,
        contact,
        eyeClose,
        facebook,
        googleIcon6,
        info,
        instra,
        logout,
        moneyExchange,
        twiter,
        warningIcons,
        web,
        whatsapp,
        youtube
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/milton.png
  AssetGenImage get milton => const AssetGenImage('assets/images/milton.png');

  /// File path: assets/images/splash_bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash_bg.png');

  /// File path: assets/images/splash_img (7).png
  AssetGenImage get splashImg7 =>
      const AssetGenImage('assets/images/splash_img (7).png');

  /// File path: assets/images/top_bg.png
  AssetGenImage get topBg => const AssetGenImage('assets/images/top_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [milton, splashBg, splashImg7, topBg];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
