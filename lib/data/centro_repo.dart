import '../models/centro_model.dart';

class CentroRepo {
  List<Centro> obtenerCentros() {
    return centrosDemo;
  }

  List<Centro> filtrar(String texto, String material) {
    return obtenerCentros().where((centro) {
      final coincideMaterial =
          material == 'Todos' || centro.materiales.contains(material);
      final coincideBusqueda = centro.nombre.toLowerCase().contains(
        texto.toLowerCase(),
      );
      return coincideMaterial && coincideBusqueda;
    }).toList();
  }

  List<Centro> obtenerPorIds(List<int> ids) {
    return obtenerCentros().where((centro) => ids.contains(centro.id)).toList();
  }
}
