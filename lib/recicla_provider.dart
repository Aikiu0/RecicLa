import 'package:flutter/material.dart';

import 'models/registro_model.dart';

class ReciclaProvider extends ChangeNotifier {
  final List<int> _favoritos = [];
  final List<Registro> _registros = [];

  List<int> get favoritos => _favoritos;

  int get cantidadFavoritos => _favoritos.length;

  bool esFavorito(int idCentro) => _favoritos.contains(idCentro);

  void alternarFavorito(int idCentro) {
    if (_favoritos.contains(idCentro)) {
      _favoritos.remove(idCentro);
    } else {
      _favoritos.add(idCentro);
    }
    notifyListeners();
  }

  List<Registro> get registros => _registros;

  double get totalKilos => _registros.fold(0, (suma, r) => suma + r.kilos);

  String get nivel {
    if (totalKilos < 5) return 'Principiante';
    if (totalKilos < 20) return 'Reciclador constante';
    return 'Eco heroe';
  }

  String? agregarRegistro(String material, String textoKilos) {
    final texto = textoKilos.trim().replaceAll(',', '.');
    if (texto.isEmpty) {
      return 'Escribe cuántos kilos reciclaste.';
    }
    final kilos = double.tryParse(texto);
    if (kilos == null) {
      return 'Escribe solo números, por ejemplo 1.5';
    }
    if (kilos <= 0) {
      return 'Los kilos deben ser mayores que 0.';
    }
    _registros.add(
      Registro(material: material, kilos: kilos, fecha: DateTime.now()),
    );
    notifyListeners();
    return null;
  }
}
