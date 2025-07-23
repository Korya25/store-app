import 'package:flutter/material.dart';
import 'package:store_app/core/resources/style/theme/color_extension.dart';

extension ContextExt on BuildContext {
  //color
  MyColors get color => Theme.of(this).extension<MyColors>()!;
}
