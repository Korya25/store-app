import 'package:flutter/material.dart';

class AppFontHandler {
  // Font Family Names
  static const String cairo = 'Cairo';
  static const String poppins = 'Poppins';

  static String getLocalizedFontFamily() {
    final currentLanguage = 'ar'; // Replace this with localization logic later
    return currentLanguage == 'ar' ? cairo : poppins;
  }

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
