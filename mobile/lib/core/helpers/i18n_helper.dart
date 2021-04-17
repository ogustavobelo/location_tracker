import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:location_tracker/core/constants/languages_const.dart';

class I18nHelper {
  static String translate(
    final BuildContext context,
    final String key, {
    final Map<String, String> params = const {},
  }) {
    return FlutterI18n.translate(context, key, translationParams: params);
  }

  static Locale getLocale(Language language) {
    if (!_languageMap.containsValue(language))
      return _languageMap[Language.english]!;
    return _languageMap[language]!;
  }

  static Map<Language, Locale> _languageMap = <Language, Locale>{
    Language.english: Locale('en', 'US'),
    Language.portuguese: Locale('pt', 'BR'),
  };
}
