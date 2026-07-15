import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_colors.dart';
import 'screens/home_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.bgPrimary,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    const ProviderScope(
      child: FlutterRoadmapApp(),
    ),
  );
}

class FlutterRoadmapApp extends StatelessWidget {
  const FlutterRoadmapApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Typography: Space Grotesk (Editorial, Industrial, Brutalist)
    final baseTextTheme = GoogleFonts.spaceGroteskTextTheme(
      ThemeData.dark().textTheme,
    );

    final mergedTextTheme = baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -1.5, height: 1.1),
      displayMedium: baseTextTheme.displayMedium?.copyWith(fontWeight: FontWeight.w800, letterSpacing: -1.0, height: 1.1),
      displaySmall: baseTextTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.5),
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.5),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.5),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
      titleLarge: baseTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      labelSmall: baseTextTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700, letterSpacing: 1.5), // For barcodes/captions
    ).apply(
      bodyColor: AppColors.text,
      displayColor: AppColors.text,
    );

    return MaterialApp(
      title: 'Flutter Roadmap 2026',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const RoadmapScrollBehavior(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgPrimary,
        primaryColor: AppColors.accent,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          secondary: AppColors.secondary,
          tertiary: AppColors.tertiary,
          surface: AppColors.bgSecondary,
          onSurface: AppColors.text,
          onPrimary: AppColors.white,
        ),
        textTheme: mergedTextTheme,
        inputDecorationTheme: const InputDecorationTheme(
          filled: false, // Outline only
          hintStyle: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w400),
          labelStyle: TextStyle(color: AppColors.text, fontWeight: FontWeight.w600),
          prefixIconColor: AppColors.text,
          suffixIconColor: AppColors.text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.border, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.border, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: AppColors.text, width: 2.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        useMaterial3: true,
      ),
      home: const RoadmapHomePage(),
    );
  }
}

class RoadmapScrollBehavior extends MaterialScrollBehavior {
  const RoadmapScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}