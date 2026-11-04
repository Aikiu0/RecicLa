import 'package:flutter/material.dart';

// Desde este ancho la app se acomoda como en PC.
const double anchoPc = 840;

bool esPantallaAncha(BuildContext context) {
  return MediaQuery.sizeOf(context).width >= anchoPc;
}

// Centra el contenido arriba y no deja que pase de anchoMaximo.
// En celular no se nota porque la pantalla es mas angosta.
class ContenidoCentrado extends StatelessWidget {
  final Widget child;
  final double anchoMaximo;

  const ContenidoCentrado({
    super.key,
    required this.child,
    this.anchoMaximo = 720,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: anchoMaximo),
        child: SizedBox(width: double.infinity, child: child),
      ),
    );
  }
}
