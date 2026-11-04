import 'package:flutter/material.dart';

import '../models/recycle_entry.dart';

class TrackingProvider extends ChangeNotifier {
  final List<RecycleEntry> _registros = [];

  List<RecycleEntry> get registros => List.unmodifiable(_registros);

  double get totalKilos =>
      _registros.fold<double>(0, (suma, r) => suma + r.kilos);

  String get nivel {
    if (totalKilos < 5) return 'Principiante';
    if (totalKilos < 20) return 'Reciclador constante';
    return 'Eco heroe';
  }

  // Avance hacia el siguiente nivel, de 0 a 1 (para la barra).
  double get progreso {
    if (totalKilos < 5) return totalKilos / 5;
    if (totalKilos < 20) return (totalKilos - 5) / 15;
    return 1;
  }

  // Texto bajo los kilos en la tarjeta de avance.
  String get siguienteMeta {
    if (totalKilos < 5) {
      return 'Te faltan ${(5 - totalKilos).toStringAsFixed(1)} kg para Reciclador constante';
    }
    if (totalKilos < 20) {
      return 'Te faltan ${(20 - totalKilos).toStringAsFixed(1)} kg para Eco heroe';
    }
    return 'Ya llegaste al nivel más alto';
  }

  void agregar(RecycleEntry registro) {
    _registros.add(registro);
    notifyListeners();
  }
}
