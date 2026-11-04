import 'package:flutter/material.dart';

import 'registro_model.dart';

// Igual que CartProvider en Vivero: guarda lo que comparten varias pantallas.
class ReciclaProvider extends ChangeNotifier {
  final List<int> _favoritos = [];
  final List<Registro> _registros = [];

  // ---------- Favoritos ----------
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

  // ---------- Seguimiento ----------
  List<Registro> get registros => _registros;

  double get totalKilos => _registros.fold(0, (suma, r) => suma + r.kilos);

  String get nivel {
    if (totalKilos < 5) return 'Principiante';
    if (totalKilos < 20) return 'Reciclador constante';
    return 'Eco heroe';
  }

  void agregarRegistro(Registro registro) {
    _registros.add(registro);
    notifyListeners();
  }
}
