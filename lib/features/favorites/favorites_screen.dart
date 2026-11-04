import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/adaptable.dart';
import '../../core/widgets/lista_centros.dart';
import '../../providers/centers_provider.dart';
import '../../providers/favorites_provider.dart';
import '../centers/center_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ids = context.watch<FavoritesProvider>().ids;
    final centros = context.watch<CentersProvider>().centrosPorIds(ids);

    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: centros.isEmpty
          ? _vacio(context)
          : ContenidoCentrado(
              anchoMaximo: 1000,
              child: ListaCentros(
                centros: centros,
                onTap: (centro) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CenterDetailScreen(centro: centro),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _vacio(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.favorite_border,
              size: 64,
              color: AppColors.textoSecundario,
            ),
            const SizedBox(height: 12),
            Text(
              'Aún no guardas centros',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            const Text(
              'Toca el corazón en el detalle de un centro para guardarlo aquí.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
