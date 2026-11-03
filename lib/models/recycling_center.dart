import 'tipo_material.dart';

class RecyclingCenter {
  final String id;
  final String nombre;
  final String direccion;
  final String horario;
  final List<TipoMaterial> materiales;
  final String imagen; // solo el nombre del archivo

  const RecyclingCenter({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.horario,
    required this.materiales,
    required this.imagen,
  });

  String get rutaImagen => 'assets/images/$imagen';
}
