import 'tipo_material.dart';

class RecycleEntry {
  final TipoMaterial material;
  final double kilos;
  final DateTime fecha;

  const RecycleEntry({
    required this.material,
    required this.kilos,
    required this.fecha,
  });
}
