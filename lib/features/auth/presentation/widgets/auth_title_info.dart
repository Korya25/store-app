import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/presentation/animations/animate_do.dart';
import 'package:store_app/core/presentation/widgets/text_app.dart';
import 'package:store_app/core/resources/style/fonts/app_text_styles.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({
    required this.description,
    required this.title,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          // title
          TextApp(text: title, style: AppTextStyles.font24Bold(context)),
          SizedBox(height: 10.h),
          TextApp(
            text: description,
            style: AppTextStyles.font16Medium(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
