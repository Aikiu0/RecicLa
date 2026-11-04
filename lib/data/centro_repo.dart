import '../models/centro_model.dart';

// Por ahora los centros salen de la lista local (centrosDemo).
// En la Etapa 2 solo se cambia este archivo para leerlos de Firebase.
class CentroRepo {
  List<Centro> obtenerCentros() {
    return centrosDemo;
  }
}
