import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/core/resources/localization/app_localizations_delegate.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  Future<bool> load() async {
    final String jsonString = await rootBundle.loadString(
      'lang/${locale.languageCode}.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? '** $key not found';
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  static List<Locale> get supportedLocales => const [
    Locale('en'),
    Locale('ar'),
  ];
}
