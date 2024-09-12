import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

void toastWarning(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: const Color.fromARGB(255, 253, 138, 50),
    textColor: AppColors.white,
    webPosition: 'center',
  );
}

void toastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message,
    timeInSecForIosWeb: 2,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: AppColors.green,
    textColor: AppColors.white,
    webPosition: 'center',
  );
}

void toastDanger(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    backgroundColor: AppColors.red,
    textColor: AppColors.white,
  );
}
