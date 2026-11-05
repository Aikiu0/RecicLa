import 'package:flutter/material.dart';

class AppColors {
  static const Color primario = Color(0xFF00796B);
  static const Color primarioClaro = Color(0xFFE0F2F1);
  static const Color acento = Color(0xFFFFB300);
  static const Color textoPrincipal = Color(0xFF263238);
  static const Color textoSecundario = Color(0xFF607D8B);
  static const Color fondo = Color(0xFFF5F7F6);
}

class AppSpacing {
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
}

ThemeData buildReciclaTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.fondo,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primario,
      primary: AppColors.primario,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primario,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textoPrincipal,
      ),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.textoPrincipal),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primario,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
