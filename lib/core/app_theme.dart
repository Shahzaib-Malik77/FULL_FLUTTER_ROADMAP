import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Acid Grotesk Design Tokens
/// 
/// Strict geometric, zero-radius, border-heavy, high contrast.
class AppTextStyles {
  AppTextStyles._();

  // Headings use Space Grotesk / Heavy weight
  static const TextStyle display = TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: AppColors.text, height: 1.1, letterSpacing: -1.5);
  static const TextStyle h2     = TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.text, height: 1.2, letterSpacing: -1.0);
  static const TextStyle h3     = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.text, height: 1.3, letterSpacing: -0.5);
  
  // Body uses Space Grotesk
  static const TextStyle bodyLarge = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.text, height: 1.5);
  static const TextStyle body     = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.text, height: 1.5);
  static const TextStyle bodySmall = TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textLight, height: 1.4);

  // Technical Labels
  static const TextStyle button = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.text, letterSpacing: 1.0);
  static const TextStyle label  = TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.textLight, letterSpacing: 1.5);
  static const TextStyle badge  = TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: AppColors.text, letterSpacing: 2.0);
}

class AppTheme {
  AppTheme._();

  // ─── Border Tokens ──────────────────────────────────
  static const double borderDefault = 2.0;  
  static const double borderThick  = 4.0;

  // ─── Radius Tokens ─────────────────────────────────
  static const double radiusSm   = 0.0;
  static const double radiusMd   = 0.0;
  static const double radiusLg   = 0.0;
  static const double radiusFull = 0.0; 

  // ─── Shadow Tokens ─────────────────────────────────
  static const List<BoxShadow> shadowPop = [];
  static const List<BoxShadow> shadowPopHover = [];
  static const List<BoxShadow> shadowPopActive = [];
  static const List<BoxShadow> shadowAccent = [];
  static const List<BoxShadow> shadowPink = [];

  // ─── Curves ────────────────────────────────────────
  static const Curve bouncyCurve = Curves.easeInOut; // Subtle instead of bouncy
  static const Duration animFast = Duration(milliseconds: 200);
  static const Duration animNormal = Duration(milliseconds: 300);

  // ─── Theme Data ────────────────────────────────────
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgPrimary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
        surface: AppColors.bgSecondary,
        onPrimary: AppColors.black,
        onSecondary: AppColors.black,
        onSurface: AppColors.text,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bgPrimary,
        foregroundColor: AppColors.text,
        elevation: 0,
        centerTitle: false,
      ),
      useMaterial3: true,
    );
  }
}
