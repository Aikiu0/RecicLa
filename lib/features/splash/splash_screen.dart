import 'package:flutter/material.dart';

import '../home/home_screen.dart';

// TEMPORAL: el Integrante 3 la reemplaza por el splash real.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          ),
          child: const Text('Entrar (splash temporal)'),
        ),
      ),
    );
  }
}
