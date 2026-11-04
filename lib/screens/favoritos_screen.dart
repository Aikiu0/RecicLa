import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/centro_card.dart';
import '../models/centro_model.dart';
import '../data/centro_repo.dart';
import '../core/core_theme.dart';
import 'detalle_screen.dart';
import '../recicla_provider.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ids = context.watch<ReciclaProvider>().favoritos;
    final List<Centro> favoritos = CentroRepo()
        .obtenerCentros()
        .where((centro) => ids.contains(centro.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: favoritos.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 64,
                      color: AppColors.textoSecundario,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Aún no guardas centros',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Toca el corazón en el detalle de un centro para guardarlo aquí.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: favoritos.map((centro) {
                    return CentroCard(
                      nombre: centro.nombre,
                      direccion: centro.direccion,
                      materiales: centro.materiales.join(', '),
                      rutaImagen: centro.rutaImagen,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalleScreen(centro: centro),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
