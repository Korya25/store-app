import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/core/serivces/shared_pref/pref_keys.dart';
import 'package:store_app/core/serivces/shared_pref/shared_pref.dart';

part 'app_cubit_state.dart';
part 'app_cubit_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());
  bool isDark = true;
  String currentLangCode = 'en';

  // Theme Mode

  Future changeTHemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref.preferences
          .setBoolean(PrefKeys.themeMode, isDark)
          .then((value) => emit(AppState.themeChangeMode(isDark: isDark)));
    }
  }

  // Saved Language
  void getSavedLanguage() {
    final resualt = SharedPref.preferences.containPreference(PrefKeys.language)
        ? SharedPref.preferences.getString(PrefKeys.language)
        : 'en';

    currentLangCode = resualt!;

    emit(AppState.languageChangeMode(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref.preferences.setString(PrefKeys.language, langCode);

    currentLangCode = langCode;
    emit(AppState.languageChangeMode(locale: Locale(currentLangCode)));
  }

  void toArbic() => _changeLang('ar');
  void toEnglish() => _changeLang('en');
}
