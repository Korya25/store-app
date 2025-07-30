import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/presentation/animations/animate_do.dart';
import 'package:store_app/core/presentation/widgets/custom_linear_button.dart';
import 'package:store_app/core/presentation/widgets/text_app.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/localization/app_localizations_keys.dart';
import 'package:store_app/core/resources/router/app_routes.dart';
import 'package:store_app/core/resources/style/fonts/app_text_styles.dart';
import 'package:store_app/core/utils/5.1%20show_toast.dart';
import 'package:store_app/features/auth/presentation/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (userRole) {
              ShowToast.showToastSuccessTop(
                context: context,
                message: context.tr(LangKeys.loggedSuccessfully),
              );
              if (userRole == 'admin') {
                context.goNamed(AppRoutes.admin);
              } else {
                context.goNamed(AppRoutes.customer);
              }
            },
            erorr: (error) {
              ShowToast.showToastErrorTop(
                context: context,
                message: context.tr(error),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                height: 50.h,
                width: double.infinity,
                onPressed: () {},

                child: CircularProgressIndicator(color: Colors.white),
              );
            },
            orElse: () {
              return CustomLinearButton(
                height: 50.h,
                width: double.infinity,
                onPressed: () {
                  _validateThenDoLogin(context);
                },
                child: TextApp(
                  text: context.tr(LangKeys.login),
                  style: AppTextStyles.font18BoldWhite(context),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    final form = context.read<AuthBloc>().formKey.currentState;
    if (form != null && form.validate()) {
      context.read<AuthBloc>().add(AuthEvent.login());
    }
  }
}
