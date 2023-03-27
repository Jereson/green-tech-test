import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/utils/color_utils.dart';

flushbar(
    {@required BuildContext? context,
    @required String? title,
    @required String? message,
    @required bool? isSuccess,
    int duration = 5}) {
  Flushbar(
          title: title,
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
          flushbarStyle: FlushbarStyle.FLOATING,
          duration: Duration(seconds: duration),
          backgroundColor: isSuccess!
              ? kcPrimaryColor.withOpacity(0.8)
              : Colors.red.withOpacity(0.8),
          icon: isSuccess
              ? const Icon(
                  Icons.check,
                  color: kcPrimaryColor,
                )
              : const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ))
      .show(context!);
}
