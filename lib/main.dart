import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_colors.dart';
import 'screens/home_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const FlutterRoadmapApp());
}

class FlutterRoadmapApp extends StatelessWidget {
  const FlutterRoadmapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Roadmap 2026',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const RoadmapScrollBehavior(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bgPrimary,
        primaryColor: AppColors.accentYellow,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accentYellow,
          secondary: AppColors.accentPink,
          surface: AppColors.bgPrimary,
          onSurface: AppColors.textLight,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.bgSecondary,
          hintStyle: TextStyle(color: AppColors.text.withValues(alpha: 0.5)),
          labelStyle: const TextStyle(color: AppColors.text),
          prefixIconColor: AppColors.text,
          suffixIconColor: AppColors.text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.text, width: 2.2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.text, width: 2.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.text, width: 2.2),
          ),
        ),
        fontFamily: 'Segoe UI',
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