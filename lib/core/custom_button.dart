import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final IconData? icono;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    if (icono != null) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icono),
          label: Text(texto),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(texto)),
    );
  }
}
