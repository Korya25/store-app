import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/style/fonts/app_font_handler.dart';

class AppTextStyles {
  static TextStyle headlineLarge(BuildContext context) {
    return TextStyle(
      fontFamily: AppFontHandler.getLocalizedFontFamily(),
      fontWeight: AppFontHandler.medium,
      fontSize: 18.sp,
      color: context.color.textColor,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return TextStyle(
      fontFamily: AppFontHandler.getLocalizedFontFamily(),
      fontWeight: AppFontHandler.regular,
      fontSize: 14.sp,
      color: context.color.textColor,
    );
  }

  // Add more styles as needed
}
