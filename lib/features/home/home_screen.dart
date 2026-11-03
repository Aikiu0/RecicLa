import 'package:flutter/material.dart';

import '../centers/centers_screen.dart';
import '../favorites/favorites_screen.dart';
import '../guide/guide_screen.dart';
import '../tracking/tracking_screen.dart';

// TEMPORAL: el Integrante 3 la reemplaza por el Home real.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _ir(BuildContext context, Widget pantalla) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => pantalla));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RecicLa (home temporal)')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Centros'),
            onTap: () => _ir(context, const CentersScreen()),
          ),
          ListTile(
            title: const Text('Favoritos'),
            onTap: () => _ir(context, const FavoritesScreen()),
          ),
          ListTile(
            title: const Text('Guía'),
            onTap: () => _ir(context, const GuideScreen()),
          ),
          ListTile(
            title: const Text('Seguimiento'),
            onTap: () => _ir(context, const TrackingScreen()),
          ),
        ],
      ),
    );
  }
}
