import 'package:flutter/material.dart';

import 'catalogo_screen.dart';
import 'core_theme.dart';
import 'custom_button.dart';
import 'guia_model.dart';

class GuiaScreen extends StatelessWidget {
  const GuiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guía de materiales')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ...guiaDemo.map((guia) => _tarjeta(context, guia)),
              const SizedBox(height: 8),
              const Text(
                fuenteGuia,
                style: TextStyle(fontSize: 12, color: AppColors.textoSecundario),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, GuiaMaterial guia) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.recycling, color: AppColors.primario),
              const SizedBox(width: 8),
              Text(
                guia.material,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Cómo prepararlo',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(guia.comoPreparar),
          const SizedBox(height: 8),
          const Text('Evita', style: TextStyle(fontWeight: FontWeight.w600)),
          Text(guia.evitar),
          const SizedBox(height: 12),
          CustomButton(
            texto: 'Ver centros que lo reciben',
            icono: Icons.location_on,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CatalogoScreen(materialInicial: guia.material),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
