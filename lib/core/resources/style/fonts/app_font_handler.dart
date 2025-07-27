import 'package:flutter/material.dart';
import 'package:store_app/core/serivces/shared_pref/pref_keys.dart';
import 'package:store_app/core/serivces/shared_pref/shared_pref.dart';

class AppFontHandler {
  // Font Family Names
  static const String cairo = 'Cairo';
  static const String poppins = 'Poppins';

  static String getLocalizedFontFamily() {
    final currentLanguage = SharedPref.preferences.getString(PrefKeys.language);
    return currentLanguage == 'ar' ? cairo : poppins;
  }

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
