import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'catalogo_screen.dart';
import 'core_theme.dart';
import 'custom_button.dart';
import 'favoritos_screen.dart';
import 'guia_screen.dart';
import 'recicla_provider.dart';
import 'seguimiento_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recicla = context.watch<ReciclaProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('RecicLa'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.white),
                const SizedBox(width: 4),
                Text(
                  '${recicla.cantidadFavoritos}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.primario,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 90,
                    height: 90,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text('¡Hola!', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 4),
                const Text(
                  '¿Qué vas a reciclar hoy?',
                  style: TextStyle(color: AppColors.textoSecundario),
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: _InfoCard(
                        icono: Icons.scale,
                        texto:
                            '${recicla.totalKilos.toStringAsFixed(1)} kg reciclados',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _InfoCard(
                        icono: Icons.emoji_events,
                        texto: recicla.nivel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomButton(
                  texto: 'Centros de acopio',
                  icono: Icons.location_on,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CatalogoScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                CustomButton(
                  texto: 'Guía de materiales',
                  icono: Icons.menu_book,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GuiaScreen()),
                    );
                  },
                ),
                const SizedBox(height: 12),
                CustomButton(
                  texto: 'Mi seguimiento',
                  icono: Icons.bar_chart,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SeguimientoScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                CustomButton(
                  texto: 'Mis favoritos',
                  icono: Icons.favorite,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritosScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _InfoCard({required this.icono, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.primarioClaro,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icono, color: AppColors.primario),
          const SizedBox(height: 8),
          Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primario,
            ),
          ),
        ],
      ),
    );
  }
}
