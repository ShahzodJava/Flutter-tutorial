import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LANGUAGE_KEY = 'languageKey';

const String ENGLISH = 'en';
const String UZBEK = 'uz';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_KEY, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_KEY) ?? ENGLISH;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, 'US');
    case UZBEK:
      return const Locale(UZBEK, 'UZB');
    default:
      return const Locale(ENGLISH, 'US');
  }
}
AppLocalizations text(BuildContext context) {
  return AppLocalizations.of(context)!;
}