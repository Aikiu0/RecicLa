import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/adaptable.dart';
import '../../core/widgets/tarjeta_avance.dart';
import '../../providers/favorites_provider.dart';
import '../favorites/favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final totalFavoritos = context.watch<FavoritesProvider>().ids.length;
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('RecicLa')),
      body: ContenidoCentrado(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('¡Hola!', style: textos.headlineSmall),
            const Text('¿Qué vas a reciclar hoy?'),
            const SizedBox(height: 16),
            const TarjetaAvance(),
            const SizedBox(height: 12),
            _AccesoHome(
              icono: Icons.favorite,
              titulo: 'Mis favoritos ($totalFavoritos)',
              subtitulo: 'Centros que guardaste',
              destino: const FavoritesScreen(),
            ),
            _consejo(textos),
          ],
        ),
      ),
    );
  }

  Widget _consejo(TextTheme textos) {
    return Card(
      color: AppColors.primarioClaro,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.info, color: AppColors.primario),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Consejo',
                    style: textos.titleSmall?.copyWith(
                      color: AppColors.primario,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Enjuaga y seca tus envases antes de llevarlos: así sí te los reciben.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccesoHome extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String subtitulo;
  final Widget destino;

  const _AccesoHome({
    required this.icono,
    required this.titulo,
    required this.subtitulo,
    required this.destino,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primarioClaro,
          child: Icon(icono, color: AppColors.primario),
        ),
        title: Text(titulo),
        subtitle: Text(subtitulo),
        trailing: const Icon(Icons.chevron_right),
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => destino)),
      ),
    );
  }
}
