import 'package:flutter/material.dart';
import 'package:store_app/core/resources/localization/app_localizations.dart';
import 'package:store_app/core/resources/style/theme/color_extension.dart';

extension ContextExt on BuildContext {
  //color
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  String tr(String key) => AppLocalizations.of(this).translate(key);
}
