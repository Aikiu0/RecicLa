import '../models/guia_material.dart';
import '../models/tipo_material.dart';

// ANTES DEL COMMIT: cambia esta linea por la fuente real que consultaste
// (documento, institucion y anio) y corrige los consejos con tus palabras.
const String fuenteGuia =
    'Fuente: PENDIENTE (documento, institucion y anio que consultaron)';

const List<GuiaMaterial> guiaMateriales = [
  GuiaMaterial(
    material: TipoMaterial.plastico,
    comoPreparar: 'Enjuaga y seca los envases. Aplasta las botellas.',
    evitar: 'Envases con restos de comida o aceite.',
  ),
  GuiaMaterial(
    material: TipoMaterial.vidrio,
    comoPreparar: 'Enjuaga botellas y frascos y quítales la tapa.',
    evitar: 'Espejos, focos o vidrio de ventana mezclados con envases.',
  ),
  GuiaMaterial(
    material: TipoMaterial.papel,
    comoPreparar: 'Junta hojas y periódico secos, sin grapas ni clips.',
    evitar: 'Papel sucio, servilletas usadas o papel encerado.',
  ),
  GuiaMaterial(
    material: TipoMaterial.carton,
    comoPreparar: 'Desarma las cajas y guárdalas planas y secas.',
    evitar: 'Cartón mojado o con grasa, como cajas de pizza.',
  ),
  GuiaMaterial(
    material: TipoMaterial.metal,
    comoPreparar: 'Enjuaga las latas y aplástalas.',
    evitar: 'Latas de pintura o aerosoles.',
  ),
  GuiaMaterial(
    material: TipoMaterial.electronicos,
    comoPreparar: 'Llévalos completos y quítales las pilas.',
    evitar: 'Tirarlos a la basura o romper pantallas y baterías.',
  ),
];
