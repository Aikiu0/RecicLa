import 'package:flutter/material.dart';

import 'core_theme.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  decoration: const BoxDecoration(
                    color: AppColors.primarioClaro,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.recycling,
                    size: 100,
                    color: AppColors.primario,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Recicla, aprende y mide tu avance',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Encuentra centros de acopio en Pachuca, aprende a separar '
                  'tus residuos y registra cuántos kilos reciclas.',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.textoSecundario,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text('Comenzar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
