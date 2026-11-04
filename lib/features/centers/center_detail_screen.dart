import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/custom_button.dart';
import '../../models/recycling_center.dart';

class CenterDetailScreen extends StatelessWidget {
  final RecyclingCenter centro;
  const CenterDetailScreen({super.key, required this.centro});

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(centro.nombre),
        // Al integrar Favoritos: actions: [FavoriteButton(centroId: centro.id)],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                centro.rutaImagen,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: AppColors.primarioClaro,
                  child: const Center(
                    child: Icon(
                      Icons.recycling,
                      size: 64,
                      color: AppColors.primario,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(centro.nombre, style: textos.headlineSmall),
            const SizedBox(height: 12),
            _dato(Icons.place, centro.direccion),
            _dato(Icons.schedule, centro.horario),
            const SizedBox(height: 16),
            Text('Materiales que recibe', style: textos.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: centro.materiales
                  .map((m) => Chip(label: Text(m.etiqueta)))
                  .toList(),
            ),
            const SizedBox(height: 24),
            CustomButton(
              texto: 'Volver',
              icono: Icons.arrow_back,
              secundario: true,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dato(IconData icono, String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icono, color: AppColors.primario),
          const SizedBox(width: 8),
          Expanded(child: Text(texto)),
        ],
      ),
    );
  }
}
