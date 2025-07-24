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

  static TextStyle hintStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFontHandler.getLocalizedFontFamily(),
      color: context.color.textColor,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
    );
  }

  static TextStyle errorStyle(BuildContext context) {
    return TextStyle(
      fontFamily: AppFontHandler.getLocalizedFontFamily(),
      color: Colors.red,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
    );
  }
}
