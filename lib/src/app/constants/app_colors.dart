import 'package:flutter/material.dart';

class AppColors {
  // ------------------ LIGHT THEME ------------------
  // Background Colors
  static const Color lightBackground = Color(0xFFF8F8F8);

  // Surface / Card Colors (v1.0.3 — KYC roadmap & wizard cards)
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE0E0E0);

  // Primary Colors
  static const Color lightPrimary = Color(0xFF4CD080);

  // Text Colors
  static const Color lightTextPrimary = Color(0xFF1A202C);
  static const Color lightTextSecondary = Color(0xFF6B6B6B);
  static Color lightTextTertiary = Color(0xFF1A202C).withValues(alpha: 0.30);
  static const Color lightTextHint = Color(0xFF757575);

  // ------------------ UTILS ------------------

  // Error/Warning/Success (+ tonal containers for status banners)
  static const Color error = Color(0xFFDC3C22);
  static const Color warning = Color(0xFFFFAA00);
  static const Color success = Color(0xFF14AE6F);
  static const Color info = Color(0xFF2196F3);
  static const Color errorContainer = Color(0xFFFDECEA);
  static const Color warningContainer = Color(0xFFFFF8E1);
  static const Color infoContainer = Color(0xFFE3F2FD);

  // Utility
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
}
