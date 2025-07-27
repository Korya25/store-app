import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/presentation/animations/animate_do.dart';
import 'package:store_app/core/presentation/controller/cubit/app_cubit_cubit.dart';
import 'package:store_app/core/presentation/widgets/custom_linear_button.dart';
import 'package:store_app/core/presentation/widgets/text_app.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/localization/app_localizations.dart';
import 'package:store_app/core/resources/localization/app_localizations_keys.dart';
import 'package:store_app/core/resources/style/fonts/app_text_styles.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark Mode Button
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
              cubit.changeTHemeMode();
            },
            child: Icon(
              cubit.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              color: Colors.white,
            ),
          ),
        ),
        //Language Button
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {
              if (AppLocalizations.of(context).locale.languageCode == 'en') {
                cubit.toArbic();
              } else {
                cubit.toEnglish();
              }
            },
            height: 44.h,
            width: 100.w,
            child: TextApp(
              text: context.tr(LangKeys.language),
              style: AppTextStyles.font16Bold(context),
            ),
          ),
        ),
      ],
    );
  }
}
