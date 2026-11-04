import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<String> _ids = [];

  List<String> get ids => List.unmodifiable(_ids);

  bool esFavorito(String id) => _ids.contains(id);

  void alternar(String id) {
    if (_ids.contains(id)) {
      _ids.remove(id);
    } else {
      _ids.add(id);
    }
    notifyListeners();
  }
}
