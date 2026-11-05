import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/centro_model.dart';
import '../core/core_theme.dart';
import '../core/custom_button.dart';
import '../recicla_provider.dart';

class DetalleScreen extends StatelessWidget {
  final Centro centro;

  const DetalleScreen({super.key, required this.centro});

  @override
  Widget build(BuildContext context) {
    final esFavorito = context.watch<ReciclaProvider>().esFavorito(centro.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(centro.nombre),
        actions: [
          IconButton(
            icon: Icon(
              esFavorito ? Icons.favorite : Icons.favorite_border,
              color: esFavorito ? Colors.redAccent : Colors.white,
            ),
            onPressed: () {
              context.read<ReciclaProvider>().alternarFavorito(centro.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
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
                      width: double.infinity,
                      color: AppColors.primarioClaro,
                      child: const Icon(
                        Icons.recycling,
                        size: 64,
                        color: AppColors.primario,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  centro.nombre,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.md),
                _InfoRow(
                  icon: Icons.place,
                  titulo: 'Dirección',
                  valor: centro.direccion,
                ),
                const SizedBox(height: AppSpacing.sm),
                _InfoRow(
                  icon: Icons.schedule,
                  titulo: 'Horario',
                  valor: centro.horario,
                ),
                const SizedBox(height: AppSpacing.md),
                const Text(
                  'Materiales que recibe',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: centro.materiales.map((material) {
                    return Chip(
                      label: Text(material),
                      backgroundColor: AppColors.primarioClaro,
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomButton(
                  texto: esFavorito ? 'Quitar de favoritos' : 'Guardar en favoritos',
                  icono: esFavorito ? Icons.favorite : Icons.favorite_border,
                  onPressed: () {
                    context.read<ReciclaProvider>().alternarFavorito(centro.id);
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

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String valor;

  const _InfoRow({
    required this.icon,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primario),
        const SizedBox(width: AppSpacing.sm),
        Text('$titulo: ', style: const TextStyle(fontWeight: FontWeight.w600)),
        Expanded(child: Text(valor)),
      ],
    );
  }
}
