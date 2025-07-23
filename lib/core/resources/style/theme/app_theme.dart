import 'package:flutter/material.dart';
import 'package:store_app/core/resources/style/fonts/app_font_handler.dart';
import 'package:store_app/core/resources/style/theme/app_colors.dart';
import 'package:store_app/core/resources/style/theme/color_extension.dart';

class AppTheme {
  static ThemeData themeDark() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsDark.mainColor,
      useMaterial3: true,
      extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
      textTheme: _getTextTheme(isDark: true),
    );
  }

  static ThemeData themeLight() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      useMaterial3: true,
      extensions: const <ThemeExtension<dynamic>>[MyColors.light],
      textTheme: _getTextTheme(isDark: false),
    );
  }

  static TextTheme _getTextTheme({required bool isDark}) {
    final baseColor = isDark ? Colors.white : Colors.black;

    return TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: baseColor,
        fontFamily: AppFontHandler.getLocalizedFontFamily(),
        fontWeight: AppFontHandler.medium,
      ),
    );
  }
}
