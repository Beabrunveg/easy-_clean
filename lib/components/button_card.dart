import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    required this.label,
    required this.onPressed,
    this.color,
    super.key,
  });
  final String label;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color!.withOpacity(.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color!,
          ),
        ),
        padding: padSy12.copyWith(
          top: 4,
          bottom: 4,
        ),
        child: Column(
          children: [
            Icon(
              Icons.add_circle_outline_rounded,
              color: color,
            ),
            Text(
              label,
              style: TextStyleApp.caption.w800.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
