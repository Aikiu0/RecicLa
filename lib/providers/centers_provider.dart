import 'package:flutter/material.dart';

import '../data/repositories/center_repository.dart';
import '../models/recycling_center.dart';
import '../models/tipo_material.dart';

class CentersProvider extends ChangeNotifier {
  final CenterRepository _repo;
  CentersProvider(this._repo);

  List<RecyclingCenter> _centros = [];
  bool _cargando = true;
  String _busqueda = '';
  TipoMaterial? _filtro; // null significa todos los materiales

  bool get cargando => _cargando;
  String get busqueda => _busqueda;
  TipoMaterial? get filtro => _filtro;
  Future<void> cargar() async {
    _centros = await _repo.obtenerCentros();
    _cargando = false;
    notifyListeners();
  }

  List<RecyclingCenter> get centrosFiltrados {
    final texto = _busqueda.toLowerCase();
    return _centros.where((c) {
      final coincideNombre = c.nombre.toLowerCase().contains(texto);
      final coincideMaterial =
          _filtro == null || c.materiales.contains(_filtro);
      return coincideNombre && coincideMaterial;
    }).toList();
  }

  RecyclingCenter? buscarPorId(String id) {
    for (final c in _centros) {
      if (c.id == id) return c;
    }
    return null;
  }

  List<RecyclingCenter> centrosPorIds(List<String> ids) {
    final resultado = <RecyclingCenter>[];
    for (final id in ids) {
      final centro = buscarPorId(id);
      if (centro != null) resultado.add(centro);
    }
    return resultado;
  }

  void buscar(String texto) {
    _busqueda = texto;
    notifyListeners();
  }

  void filtrarPor(TipoMaterial? material) {
    _filtro = material;
    notifyListeners();
  }
}
