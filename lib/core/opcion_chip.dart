import 'package:flutter/material.dart';

import 'core_theme.dart';

class OpcionChip extends StatelessWidget {
  final String texto;
  final bool seleccionado;
  final VoidCallback onTap;

  const OpcionChip({
    super.key,
    required this.texto,
    required this.seleccionado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: seleccionado ? AppColors.primarioClaro : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: seleccionado ? AppColors.primario : Colors.black26,
          ),
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: seleccionado ? AppColors.primario : AppColors.textoPrincipal,
            fontWeight: seleccionado ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
