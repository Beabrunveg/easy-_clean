import 'package:flutter/material.dart';

class AppColors {
  static const Color green = Color(0xFF21A629);
  static const Color green1000 = Color(0xFF08202a);
  static const Color blue50 = Color(0xFF5897E7);
  static const Color blue100 = Color(0xFF3D7CC9);
  static const Color blue200 = Color(0xFF11519B);
  static const Color gray = Color(0xFFA4A8AE);
  static const Color gray100 = Color(0xFFF6F7F9);
  static const Color white50 = Color(0xFFE2ECF8);
  static const Color white100 = Color(0xFFE1EFE2);
  static const Color white200 = Color(0xFFF7DFDE);
  static const Color red = Color(0xFFC33131);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bg = Color(0xFFF2F6FB);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    final colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color),
      500: color,
      600: getShade(color, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }
}
