import 'dart:ui';

import 'package:aakscience_test/translations/en.dart';
import 'package:easy_localization/easy_localization.dart';

class MapAssetLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {

    final String localeKey = locale.languageCode;
    if (!translations.containsKey(localeKey)) {
      throw Exception('Translations for locale $localeKey not found');
    }
    return translations[localeKey]!;
  }
}

final translations = {'en': TEN.en,};
