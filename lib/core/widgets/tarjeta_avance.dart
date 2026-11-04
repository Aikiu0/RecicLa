import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/tracking_provider.dart';
import '../theme/app_theme.dart';

class TarjetaAvance extends StatelessWidget {
  final String titulo;

  const TarjetaAvance({super.key, this.titulo = 'Tu avance'});

  @override
  Widget build(BuildContext context) {
    final tracking = context.watch<TrackingProvider>();
    final textos = Theme.of(context).textTheme;

    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(titulo, style: textos.titleMedium)),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.acento.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(tracking.nivel, style: textos.labelMedium),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '${tracking.totalKilos.toStringAsFixed(1)} kg reciclados',
              style: textos.headlineSmall,
            ),
            Text(tracking.siguienteMeta, style: textos.bodySmall),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: tracking.progreso,
              minHeight: 8,
              color: AppColors.acento,
              backgroundColor: AppColors.primarioClaro,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
}
