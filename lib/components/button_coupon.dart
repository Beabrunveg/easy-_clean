import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

enum StatusReedem { available, notAvailable, redeemed }

class ButtonCoupon extends StatelessWidget {
  const ButtonCoupon({
    required this.onPressed,
    required this.label,
    required this.message,
    required this.statusReedem,
    super.key,
  });
  final VoidCallback onPressed;
  final String message;
  final String label;
  final StatusReedem statusReedem;

  Color get color {
    switch (statusReedem) {
      case StatusReedem.available:
        return AppColors.green.withOpacity(0.1);
      case StatusReedem.notAvailable:
        return AppColors.gray.withOpacity(0.3);
      case StatusReedem.redeemed:
        return AppColors.blue50.withOpacity(0.15);
    }
  }

  Color get colorLabel {
    switch (statusReedem) {
      case StatusReedem.available:
        return AppColors.green;
      case StatusReedem.notAvailable:
        return AppColors.white;
      case StatusReedem.redeemed:
        return AppColors.blue100;
    }
  }

  Color get colorMessage {
    switch (statusReedem) {
      case StatusReedem.available:
        return AppColors.black;
      case StatusReedem.notAvailable:
        return AppColors.white;
      case StatusReedem.redeemed:
        return AppColors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padSy8,
          elevation: 6,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          children: [
            Text(
              message,
              style: TextStyleApp.body.white.w500.copyWith(
                color: colorMessage,
              ),
              textAlign: TextAlign.center,
            ),
            space16,
            Text(
              label,
              style: TextStyleApp.body.w700.copyWith(
                color: colorLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
