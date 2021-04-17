import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:location_tracker/core/constants/languages_const.dart';
import 'package:location_tracker/core/helpers/i18n_helper.dart';
import 'package:location_tracker/core/themes/themes.dart';
import 'package:location_tracker/presentation/home/home_screen.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Location tracker',
        theme: Themes.defaultTheme,
        home: HomeScreen(),
        localizationsDelegates: [
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
              useCountryCode: true,
              basePath: 'assets/i18n',
              decodeStrategies: [YamlDecodeStrategy()],
              fallbackFile: 'en_US',
              forcedLocale: I18nHelper.getLocale(Language.english),
            ),
          ),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
