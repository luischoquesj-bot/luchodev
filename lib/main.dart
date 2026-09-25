import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_typography.dart';

/// Global notifier for ThemeMode, default is light theme as requested.
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.clear();
  PaintingBinding.instance.imageCache.clearLiveImages();
  runApp(const LuChoDevApp());
}

class LuChoDevApp extends StatelessWidget {
  const LuChoDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, currentThemeMode, _) {
        return MaterialApp(
          title: 'LuCho Dev | Mobile App Developer (iOS & Android) & Privacidad',
          debugShowCheckedModeBanner: false,
          themeMode: currentThemeMode,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
            },
          ),
          // Light Theme (Diurna)
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFF8FAFC), // Slate 50
            cardColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF0284C7), // Sky 600
              secondary: Color(0xFF4F46E5), // Indigo 600
              surface: Colors.white,
              error: Color(0xFFDC2626),
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Color(0xFF0F172A), // Slate 900
            ),
            fontFamily: 'Inter',
            fontFamilyFallback: AppTypography.fallbackFonts,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w800,
              ),
              displayMedium: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w700,
              ),
              headlineLarge: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w700,
              ),
              headlineMedium: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w600,
              ),
              titleLarge: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: TextStyle(
                fontFamily: 'Inter',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Color(0xFF0F172A),
              ),
              bodyMedium: TextStyle(
                fontFamily: 'Inter',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Color(0xFF334155),
              ),
            ),
          ),
          // Dark Theme (Nocturna)
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF0F172A), // Slate 900
            cardColor: const Color(0xFF1E293B), // Slate 800
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF38BDF8), // Sky 400
              secondary: Color(0xFF818CF8), // Indigo 400
              surface: Color(0xFF1E293B),
              error: Color(0xFFEF4444),
              onPrimary: Colors.black,
              onSecondary: Colors.white,
              onSurface: Colors.white,
            ),
            fontFamily: 'Inter',
            fontFamilyFallback: AppTypography.fallbackFonts,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              displayMedium: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              headlineLarge: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              headlineMedium: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              titleLarge: TextStyle(
                fontFamily: 'Outfit',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: TextStyle(
                fontFamily: 'Inter',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Colors.white,
              ),
              bodyMedium: TextStyle(
                fontFamily: 'Inter',
                fontFamilyFallback: AppTypography.fallbackFonts,
                color: Color(0xFFCBD5E1),
              ),
            ),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
