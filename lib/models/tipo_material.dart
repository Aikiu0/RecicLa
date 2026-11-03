enum TipoMaterial {
  plastico('Plástico'),
  vidrio('Vidrio'),
  papel('Papel'),
  carton('Cartón'),
  metal('Metal'),
  electronicos('Electrónicos');

  final String etiqueta;
  const TipoMaterial(this.etiqueta);
}
