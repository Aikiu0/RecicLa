class GuiaMaterial {
  final String material;
  final String comoPreparar;
  final String evitar;

  const GuiaMaterial({
    required this.material,
    required this.comoPreparar,
    required this.evitar,
  });
}

const String fuenteGuia =
    'Fuente: PENDIENTE (documento, institucion y anio que consultaron)';

const List<GuiaMaterial> guiaDemo = [
  GuiaMaterial(
    material: 'Plástico',
    comoPreparar: 'Enjuaga y seca los envases. Aplasta las botellas.',
    evitar: 'Envases con restos de comida o aceite.',
  ),
  GuiaMaterial(
    material: 'Vidrio',
    comoPreparar: 'Enjuaga botellas y frascos y quítales la tapa.',
    evitar: 'Espejos, focos o vidrio de ventana mezclados con envases.',
  ),
  GuiaMaterial(
    material: 'Papel',
    comoPreparar: 'Junta hojas y periódico secos, sin grapas ni clips.',
    evitar: 'Papel sucio, servilletas usadas o papel encerado.',
  ),
  GuiaMaterial(
    material: 'Cartón',
    comoPreparar: 'Desarma las cajas y guárdalas planas y secas.',
    evitar: 'Cartón mojado o con grasa, como cajas de pizza.',
  ),
  GuiaMaterial(
    material: 'Metal',
    comoPreparar: 'Enjuaga las latas y aplástalas.',
    evitar: 'Latas de pintura o aerosoles.',
  ),
  GuiaMaterial(
    material: 'Electrónicos',
    comoPreparar: 'Llévalos completos y quítales las pilas.',
    evitar: 'Tirarlos a la basura o romper pantallas y baterías.',
  ),
];
