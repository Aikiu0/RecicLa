import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final IconData? icono;
  final bool secundario;

  const CustomButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.icono,
    this.secundario = false,
  });

  @override
  Widget build(BuildContext context) {
    final contenido = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icono != null) ...[Icon(icono), const SizedBox(width: 8)],
        Text(texto, style: const TextStyle(fontSize: 16)),
      ],
    );

    return SizedBox(
      width: double.infinity,
      child: secundario
          ? OutlinedButton(onPressed: onPressed, child: contenido)
          : ElevatedButton(onPressed: onPressed, child: contenido),
    );
  }
}
