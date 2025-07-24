import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/presentation/animations/animate_do.dart';
import 'package:store_app/core/presentation/widgets/text_app.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/localization/app_localizations_keys.dart';
import 'package:store_app/core/resources/router/app_routes.dart';
import 'package:store_app/core/resources/style/fonts/app_text_styles.dart';
import 'package:store_app/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:store_app/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:store_app/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:store_app/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:store_app/features/auth/presentation/widgets/sign_up/user_avatar_image.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: SingleChildScrollView(child: SignUpPageBody()),
        ),
      ),
    );
  }
}

class SignUpPageBody extends StatelessWidget {
  const SignUpPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Dark mode and language
        const DarkAndLangButtons(),

        SizedBox(height: 30.h),

        // Welcome Info
        AuthTitleInfo(
          title: context.tr(LangKeys.signUp),
          description: context.tr(LangKeys.signUpWelcome),
        ),
        SizedBox(height: 10.h),

        //User Avatar image
        const UserAvatarImage(),

        SizedBox(height: 20.h),

        // signup TextForm
        const SignUpForm(),

        SizedBox(height: 20.h),
        //signUpButton
        const SignUpButton(),

        SizedBox(height: 20.h),

        // Go To Login Screen
        CustomFadeInDown(
          duration: 400,
          child: TextButton(
            onPressed: () {
              context.goNamed(AppRoutes.login);
            },
            child: TextApp(
              text: context.tr(LangKeys.youHaveAccount),
              style: AppTextStyles.font14BluePinkLightBold(context),
            ),
          ),
        ),
      ],
    );
  }
}
