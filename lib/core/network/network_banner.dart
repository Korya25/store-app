import 'package:flutter/material.dart';
import 'package:store_app/core/constants/app_colors.dart';
import 'package:store_app/core/constants/app_strings.dart';
import 'package:store_app/core/presentation/widgets/custom_flushbar.dart';

enum NetworkStatusType { connected, disconnected }

class NetworkBanner {
  static void show(BuildContext context, NetworkStatusType status) {
    final message = status == NetworkStatusType.connected
        ? AppStrings.connected
        : AppStrings.disconnected;

    final color = status == NetworkStatusType.connected
        ? AppColors.snackBarBackgroundSuccess
        : AppColors.snackBarBackgroundFailure;

    CustomFlushbar.custom(
      context: context,
      message: message,
      backgroundColor: color,
    );
  }
}
