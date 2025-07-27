import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/presentation/animations/animate_do.dart';
import 'package:store_app/core/presentation/widgets/custom_text_field.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/localization/app_localizations_keys.dart';
import 'package:store_app/core/utils/validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //Email
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: context.tr(LangKeys.email),
              keyboardType: TextInputType.emailAddress,
              validator: Validator.validateEmail,
            ),
          ),
          SizedBox(height: 25.h),
          //Password
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: context.tr(LangKeys.password),
              keyboardType: TextInputType.visiblePassword,
              obscureText: isShowPassword,
              validator: Validator.validatePassword,

              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                  color: context.color.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
