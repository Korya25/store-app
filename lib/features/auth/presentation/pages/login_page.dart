import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/localization/app_localizations_keys.dart';
import 'package:store_app/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:store_app/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:store_app/features/auth/presentation/widgets/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: SingleChildScrollView(child: LoginPageBody()),
        ),
      ),
    );
  }
}

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DarkAndLangButtons(),

        AuthTitleInfo(
          description: context.tr(LangKeys.welcome),
          title: LangKeys.login,
        ),

        SizedBox(height: 30.h),

        LoginForm(),
      ],
    );
  }
}
