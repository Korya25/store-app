import 'package:flutter/material.dart';
import 'package:store_app/core/resources/app_font_handler.dart';

class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: AppFonts.bold,
    fontSize: 32,
    color: Colors.black,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: AppFonts.semiBold,
    fontSize: 24,
    color: Colors.black,
  );

  static const TextStyle title = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: AppFonts.medium,
    fontSize: 20,
    color: Colors.black,
  );

  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: AppFonts.regular,
    fontSize: 16,
    color: Colors.black87,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.poppins,
    fontWeight: AppFonts.light,
    fontSize: 12,
    color: Colors.grey,
  );
}
