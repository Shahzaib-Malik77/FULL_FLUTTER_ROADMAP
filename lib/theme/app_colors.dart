import 'package:flutter/material.dart';

/// Premium Dark Theme
/// Industrial + Modern + High Contrast

class AppColors {
  AppColors._();

  // ───────────────── Backgrounds ─────────────────

  static const Color bgPrimary   = Color(0xFF0B0B0D);
  static const Color bgSecondary = Color(0xFF121214);
  static const Color bgTertiary  = Color(0xFF1A1A1E);

  // ───────────────── Text ─────────────────

  static const Color text      = Color(0xFFFFFFFF);
  static const Color textLight = Color(0xFFD6D6D6);
  static const Color textMuted = Color(0xFF8A8A8A);

  // ───────────────── Borders ─────────────────

  static const Color border       = Color(0xFF2F2F36);
  static const Color borderStrong = Color(0xFF5A5A63);
  static const Color divider      = Color(0xFF242428);

  // ───────────────── Brand Accent ─────────────────

  static const Color accent      = Color(0xFF6EA8FE);
  static const Color accentLight = Color(0xFF8FC5FF);

  static const Color secondary   = Color(0xFF8B5CF6);
  static const Color tertiary    = Color(0xFF22C55E);
  static const Color quaternary  = Color(0xFFF59E0B);

  // ───────────────── Status ─────────────────

  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error   = Color(0xFFEF4444);
  static const Color info    = Color(0xFF3B82F6);

  // ───────────────── Convenience ─────────────────

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color primaryAccent = accent;
  static const Color blueAccent = accent;
  static const Color indigoAccent = secondary;
  static const Color accentYellow = warning;
  static const Color accentPink = Color(0xFFEC4899);
  static const Color accentRed = error;
  static const Color indigo = secondary;

  // ───────────────── Badges ─────────────────

  static const Color badgeAll = Color(0xFF1C1C20);

  static const Color badgeBeginnerBg = Color(0xFF163B2C);
  static const Color badgeBeginnerText = Color(0xFF7CFFB2);
  static const Color badgeBeginner = badgeBeginnerBg;

  static const Color badgeIntermediateBg = Color(0xFF2B2548);
  static const Color badgeIntermediateText = Color(0xFFC4B5FD);

  static const Color badgeAdvancedBg = Color(0xFF4A3212);
  static const Color badgeAdvancedText = Color(0xFFFFD089);

  static const Color badgeExpertBg = Color(0xFF4B1E25);
  static const Color badgeExpertText = Color(0xFFFFA8B5);

  // ───────────────── Confetti ─────────────────

  static const List<Color> confetti = [
    accent,
    secondary,
    success,
    warning,
    accentPink,
  ];

  static Color getConfettiColor(int index) =>
      confetti[index % confetti.length];

  // ───────────────── Section Colors ─────────────────

  static const List<Color> _sectionColors = [
    Color(0xFF6EA8FE),
    Color(0xFF22C55E),
    Color(0xFFF59E0B),
    Color(0xFFEC4899),
    Color(0xFF8B5CF6),
    Color(0xFF14B8A6),
    Color(0xFFEF4444),
  ];

  static Color getSectionColor(int index) =>
      _sectionColors[index % _sectionColors.length];

  // ───────────────── Filter Colors ─────────────────

  static Color getFilterColor(String level) {
    switch (level.toLowerCase()) {
      case 'beginner':
        return badgeBeginnerBg;
      case 'intermediate':
        return badgeIntermediateBg;
      case 'advanced':
        return badgeAdvancedBg;
      case 'expert':
        return badgeExpertBg;
      default:
        return badgeAll;
    }
  }

  static Color getFilterTextColor(String level) {
    switch (level.toLowerCase()) {
      case 'beginner':
        return badgeBeginnerText;
      case 'intermediate':
        return badgeIntermediateText;
      case 'advanced':
        return badgeAdvancedText;
      case 'expert':
        return badgeExpertText;
      default:
        return text;
    }
  }

  // ───────────────── Priority ─────────────────

  static Color getPriorityBgColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Color(0xFF4B1E25);
      case 'medium':
        return Color(0xFF4A3212);
      case 'low':
        return Color(0xFF163B2C);
      default:
        return bgTertiary;
    }
  }

  static Color getPriorityTextColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return error;
      case 'medium':
        return warning;
      case 'low':
        return success;
      default:
        return text;
    }
  }
}