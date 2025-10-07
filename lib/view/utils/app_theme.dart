import 'package:flutter/material.dart';

class AppTheme {
  static LinearGradient textOverlayGradient = LinearGradient(
    colors: [
      Colors.black.withValues(alpha: 0.45),
      Colors.black.withValues(alpha: 0.0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static Color softBorderColor = const Color(0xFFE2E2E2);
}
