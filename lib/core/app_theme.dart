import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Courier New';
  static const TextStyle display = TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: AppColors.text);
  static const TextStyle h2 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.text);
  static const TextStyle h3 = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.text);
  static const TextStyle bodyLarge = TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: AppColors.text);
  static const TextStyle body = TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.text);
  static const TextStyle bodySmall = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.text);
  static const TextStyle button = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.bgPrimary);
  static const TextStyle label = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.text);
}

/// Neo-Brutalism Theme Configuration
class AppTheme {
  AppTheme._();

  // Border tokens
  static const double borderThin = 2.0;
  static const double borderDefault = 4.0;
  static const double borderThick = 8.0;

  // Shadow tokens (hard offset, zero blur)
  static const Offset shadowSmall = Offset(4, 4);
  static const Offset shadowMedium = Offset(8, 8);
  static const Offset shadowLarge = Offset(12, 12);
  static const Offset shadowMassive = Offset(16, 16);

  static ThemeData get theme {
    return ThemeData(
      fontFamily: AppTextStyles.fontFamily,
      scaffoldBackgroundColor: AppColors.bgPrimary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accentPink,
        secondary: AppColors.accentYellow,
        surface: Colors.white,
        onPrimary: AppColors.text,
        onSecondary: AppColors.text,
        onSurface: AppColors.text,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bgPrimary,
        foregroundColor: AppColors.text,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: AppTextStyles.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: AppColors.text,
          letterSpacing: -0.5,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.display,
        headlineMedium: AppTextStyles.h2,
        headlineSmall: AppTextStyles.h3,
        titleLarge: AppTextStyles.bodyLarge,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.button,
        labelSmall: AppTextStyles.label,
      ),
      useMaterial3: true,
    );
  }
}
