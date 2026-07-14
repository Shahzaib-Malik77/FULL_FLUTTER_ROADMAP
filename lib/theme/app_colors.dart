import 'package:flutter/material.dart';

class AppColors {
  // App Canvas Background (Dark Charcoal/Burnt Cardboard)
  static const Color bgPrimary = Color(0xFF161513);
  
  // Card Background (Warm Cream/Aged Parchment fallback)
  static const Color bgSecondary = Color(0xFFEADBBE);
  
  // Vintage Ink (Dark Charcoal-Brown for Text/Icons on cards)
  static const Color text = Color(0xFF1E1C1A);
  
  // Light Text for dark backgrounds (AppBar, Buttons, Dark Badges)
  static const Color textLight = Color(0xFFEADBBE);

  // Accent Colors
  static const Color accentYellow = Color(0xFFC89332); // Old Gold
  static const Color accentPink = Color(0xFF9E443B); // Rust Red / Dark Pink
  static const Color accentCopper = Color(0xFFA65E32); // Copper
  static const Color accentBronze = Color(0xFF8F6335); // Bronze

  // Badges & Filter Colors (Aesthetic from reference)
  static const Color badgeAll = Color(0xFF4C4F56);
  static const Color badgeBeginner = Color(0xFF4A5C37);
  static const Color badgeIntermediate = Color(0xFFB05E33);
  static const Color badgeAdvanced = Color(0xFF8E3127);
  static const Color badgeExpert = Color(0xFF533B65);

  static Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'essential':
        return badgeAdvanced;
      case 'important':
        return badgeIntermediate;
      case 'optional':
        return badgeBeginner;
      default:
        return text;
    }
  }

  static Color getSectionColor(int index) {
    // Return alternate colors for progress indicators or highlights
    final colors = [accentYellow, accentPink, accentCopper, accentBronze];
    return colors[index % colors.length];
  }
  
  // Helper for filter chip backgrounds
  static Color getFilterColor(String filter) {
    switch (filter.toLowerCase()) {
      case 'all':
        return badgeAll;
      case 'beginner':
        return badgeBeginner;
      case 'intermediate':
        return badgeIntermediate;
      case 'advanced':
        return badgeAdvanced;
      case 'expert':
        return badgeExpert;
      default:
        return badgeAll;
    }
  }
}
