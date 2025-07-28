import 'package:flutter/material.dart';
import 'package:store_app/core/resources/extensions/context_extension.dart';
import 'package:store_app/core/resources/localization/app_localizations_keys.dart';

class Validator {
  // Name validation: at least 2 characters, only letters and spaces
  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return context.tr(LangKeys.fieldIsRequired);
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s]{2,}$");
    if (!nameRegex.hasMatch(value.trim())) {
      return context.tr(LangKeys.invalidName);
    }

    return null;
  }

  // Email validation
  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr(LangKeys.emailRequired);
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return context.tr(LangKeys.invalidEmail);
    }

    return null;
  }

  // Password validation
  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr(LangKeys.fieldIsRequired);
    }

    if (value.length <= 4) {
      return context.tr(LangKeys.passwordTooShort);
    }

    return null;
  }
}
