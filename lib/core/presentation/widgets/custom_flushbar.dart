import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:another_flushbar/flushbar.dart';

class CustomFlushbar {
  static Flushbar<void>? _flushbar;

  static void _show({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    IconData? icon,
    Color iconColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
  }) {
    _flushbar?.dismiss();

    _flushbar = Flushbar<void>(
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      icon: icon != null ? Icon(icon, size: 24.sp, color: iconColor) : null,
      duration: duration,
      backgroundColor: backgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      borderRadius: BorderRadius.circular(8.r),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      animationDuration: const Duration(milliseconds: 500),
    )..show(context);
  }

  static void success(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  static void error(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error,
    );
  }

  static void warning(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
    );
  }

  static void info(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
    );
  }

  static void custom({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    IconData? icon,
    Color iconColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      backgroundColor: backgroundColor,
      icon: icon,
      iconColor: iconColor,
      duration: duration,
    );
  }
}
