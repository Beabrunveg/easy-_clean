import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary({
    required this.onPressed,
    required this.label,
    super.key,
  });
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padSy16,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: AppColors.blue100,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(label, style: TextStyleApp.body.blue100.w700),
      ),
    );
  }
}
