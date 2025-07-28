import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/presentation/animations/animate_do.dart';
import 'package:store_app/core/presentation/widgets/custom_text_field.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/localization/app_localizations_keys.dart';
import 'package:store_app/core/utils/validator.dart';
import 'package:store_app/features/auth/presentation/bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isShowPassword = true;

  late AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          //Email
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.emailController,
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
              controller: _bloc.passwordController,
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
