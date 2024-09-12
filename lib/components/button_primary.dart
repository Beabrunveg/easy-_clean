import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    required this.onPressed,
    required this.label,
    super.key,
  });
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF4A90E2),
            Color(0xFF002E7A),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black.withOpacity(0.3),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyleApp.body.white.w700,
          ),
        ),
      ),
    );
  }
}
