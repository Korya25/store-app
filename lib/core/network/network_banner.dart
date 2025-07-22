import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/constants/app_colors.dart';
import 'package:store_app/core/constants/app_strings.dart';
import 'package:store_app/core/resources/app_text_styles.dart';

enum NetworkStatusType { connected, disconnected }

class NetworkBanner {
  static void show(BuildContext context, NetworkStatusType status) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(
        status == NetworkStatusType.connected
            ? AppStrings.connected
            : AppStrings.disconnected,
        style: AppTextStyles.headlineLarge,
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: status == NetworkStatusType.connected
          ? AppColors.snackBarBackgroundSuccess
          : AppColors.snackBarBackgroundFailure,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
