
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../enums/toast_state.dart';
import '../../src/app_colors.dart';
class ToastConfig{

  static showToast({
    required String msg,
    required ToastStates toastStates,
  }) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(toastStates),
        textColor: Colors.white,
        fontSize: 16.0,
      );
}


Color chooseToastColor(ToastStates state) {
  late Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = AppColors.kPrimaryRedColor;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }

  return color;
}