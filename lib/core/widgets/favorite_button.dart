import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favorites_provider.dart';

class FavoriteButton extends StatelessWidget {
  final String centroId;

  const FavoriteButton({super.key, required this.centroId});

  @override
  Widget build(BuildContext context) {
    final esFavorito = context.watch<FavoritesProvider>().esFavorito(centroId);

    return IconButton(
      icon: Icon(esFavorito ? Icons.favorite : Icons.favorite_border),
      color: esFavorito ? Colors.redAccent : null,
      tooltip: esFavorito ? 'Quitar de favoritos' : 'Guardar en favoritos',
      onPressed: () => context.read<FavoritesProvider>().alternar(centroId),
    );
  }
}
