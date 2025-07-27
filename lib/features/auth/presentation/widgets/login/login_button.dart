import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/presentation/animations/animate_do.dart';
import 'package:store_app/core/presentation/widgets/custom_linear_button.dart';
import 'package:store_app/core/presentation/widgets/text_app.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/localization/app_localizations_keys.dart';
import 'package:store_app/core/resources/style/fonts/app_text_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        height: 50.h,
        width: double.infinity,
        onPressed: () {},
        child: TextApp(
          text: context.tr(LangKeys.login),
          style: AppTextStyles.font18BoldWhite(context),
        ),
      ),
    );
  }
}
