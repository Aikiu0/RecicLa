import 'package:flutter/material.dart';

class AppColors {
  static const Color primario = Color(0xFF00796B); // verde azulado
  static const Color primarioClaro = Color(0xFFE0F2F1);
  static const Color acento = Color(0xFFFFB300); // ambar
  static const Color textoPrincipal = Color(0xFF263238);
  static const Color textoSecundario = Color(0xFF607D8B);
  static const Color fondo = Color(0xFFF5F7F6);
}

ThemeData buildRecicLaTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.fondo,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primario),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primario,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.textoPrincipal,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.textoPrincipal,
      ),
      bodyMedium: TextStyle(color: AppColors.textoPrincipal),
      bodySmall: TextStyle(color: AppColors.textoSecundario),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primario,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primario,
        side: const BorderSide(color: AppColors.primario),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
    chipTheme: const ChipThemeData(
      selectedColor: AppColors.primarioClaro,
      checkmarkColor: AppColors.primario,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: AppColors.primarioClaro,
    ),
  );
}
