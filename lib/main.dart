import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/core_theme.dart';
import 'recicla_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReciclaProvider(),
      child: const ReciclaApp(),
    ),
  );
}

class ReciclaApp extends StatelessWidget {
  const ReciclaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecicLa',
      debugShowCheckedModeBanner: false,
      theme: buildReciclaTheme(),
      home: const SplashScreen(),
    );
  }
}
