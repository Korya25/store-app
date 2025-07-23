import 'package:flutter/material.dart';
import 'package:store_app/core/resources/style/theme/app_colors.dart';
import 'package:store_app/core/resources/style/theme/color_extension.dart';

class AppTheme {
  static ThemeData themeDark() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsDark.mainColor,
      extensions: const <ThemeExtension<dynamic>>[MyColors.dark],
      useMaterial3: true,
    );
  }

  static ThemeData themeLight() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsLight.mainColor,
      extensions: const <ThemeExtension<dynamic>>[MyColors.light],
      useMaterial3: true,
    );
  }
}
