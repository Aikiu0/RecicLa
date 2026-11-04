import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/adaptable.dart';
import '../../data/guia_local.dart';
import '../../models/guia_material.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guía de materiales')),
      body: ContenidoCentrado(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (final guia in guiaMateriales) _tarjeta(context, guia),
            const SizedBox(height: 8),
            Text(fuenteGuia, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, GuiaMaterial guia) {
    final textos = Theme.of(context).textTheme;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: const CircleAvatar(
          backgroundColor: AppColors.primarioClaro,
          child: Icon(Icons.recycling, color: AppColors.primario),
        ),
        title: Text(guia.material.etiqueta, style: textos.titleMedium),
        shape: const Border(),
        collapsedShape: const Border(),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cómo prepararlo', style: textos.titleSmall),
          const SizedBox(height: 4),
          Text(guia.comoPreparar),
          const SizedBox(height: 12),
          Text('Evita', style: textos.titleSmall),
          const SizedBox(height: 4),
          Text(guia.evitar),
        ],
      ),
    );
  }
}
