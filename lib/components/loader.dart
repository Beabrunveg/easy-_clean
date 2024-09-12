import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

enum StatusProcess {
  onLoading,
  onLoaded,
  onEmpty,
  onError,
}

abstract class ProgressDialogo {
  static Future<dynamic> showLoader(BuildContext context) =>
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.green.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      );
  static Future<dynamic> showSnackBar(BuildContext context, String message) =>
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          width: double.infinity,
          height: 200,
          color: Colors.black12.withOpacity(0.5),
          child: Center(
            child: Text(message, style: TextStyleApp.body),
          ),
        ),
      );
  static Future<void> show({
    required BuildContext context,
    required Future<dynamic> Function() onLoading,
    required VoidCallback onSuccess,
    Function(String)? onError,
  }) async {
    final popUp = showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.green.withOpacity(0.5),
                ),
              ),
            ],
          ),
        );
      },
    );
    try {
      await onLoading().then(
        (value) => Navigator.pop(context),
      );
      onSuccess();
    } catch (err) {
      Navigator.pop(context);
      if (onError != null) {
        onError(err.toString());
      } else {
        rethrow;
      }
    }
    return popUp;
  }

  static Widget showLoading() =>
      const Center(child: CircularProgressIndicator());

  static void dissmiss(BuildContext context) => Navigator.pop(context);
}
