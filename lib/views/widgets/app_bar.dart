import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';

AppBar appbar(String title) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: kcPrimaryColor,
    centerTitle: true,
    title: Text(title, style: stBlack50016.copyWith(color: kcWhite)),
  );
}
