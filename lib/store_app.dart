// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/di/injuction.dart';
import 'package:store_app/core/presentation/controller/cubit/app_cubit_cubit.dart';
import 'package:store_app/core/resources/localization/app_localizations.dart';
import 'package:store_app/core/resources/style/theme/app_theme.dart';
import 'package:store_app/core/resources/router/app_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:store_app/core/serivces/shared_pref/pref_keys.dart';
import 'package:store_app/core/serivces/shared_pref/shared_pref.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<AppCubit>()
        ..changeTHemeMode(
          sharedMode: SharedPref.preferences.getBoolean(PrefKeys.themeMode),
        )
        ..getSavedLanguage(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final cubit = context.read<AppCubit>();
            return MaterialApp.router(
              // device
              // useInheritedMediaQuery: true,
              // builder: DevicePreview.appBuilder,
              title: 'Store App',
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              theme: cubit.isDark
                  ? AppTheme.themeDark()
                  : AppTheme.themeLight(),

              // Localizations
              locale: Locale(cubit.currentLangCode),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          },
        ),
      ),
    );
  }
}
