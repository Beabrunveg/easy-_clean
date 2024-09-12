import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class ButtonTertiary extends StatelessWidget {
  const ButtonTertiary({
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
          backgroundColor: AppColors.red.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: AppColors.red,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            const Icon(Icons.exit_to_app_rounded, color: AppColors.red),
            space16,
            Text(label, style: TextStyleApp.body.red.w700),
          ],
        ),
      ),
    );
  }
}
