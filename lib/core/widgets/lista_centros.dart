import 'package:flutter/material.dart';

import '../../models/recycling_center.dart';
import 'center_card.dart';

class ListaCentros extends StatelessWidget {
  final List<RecyclingCenter> centros;
  final void Function(RecyclingCenter centro) onTap;

  const ListaCentros({super.key, required this.centros, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, restricciones) {
        if (restricciones.maxWidth < 700) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: centros.length,
            itemBuilder: (context, i) => _tarjeta(centros[i]),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 340,
            mainAxisExtent: 106,
            crossAxisSpacing: 12,
          ),
          itemCount: centros.length,
          itemBuilder: (context, i) => _tarjeta(centros[i]),
        );
      },
    );
  }

  Widget _tarjeta(RecyclingCenter centro) {
    return CenterCard(centro: centro, onTap: () => onTap(centro));
  }
}
