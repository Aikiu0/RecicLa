import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/adaptable.dart';
import '../centers/centers_screen.dart';
import '../guide/guide_screen.dart';
import '../home/home_screen.dart';
import '../tracking/tracking_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _indice = 0;

  static const List<Widget> _pantallas = [
    HomeScreen(),
    CentersScreen(),
    GuideScreen(),
    TrackingScreen(),
  ];

  void _cambiar(int i) => setState(() => _indice = i);

  @override
  Widget build(BuildContext context) {
    final contenido = IndexedStack(index: _indice, children: _pantallas);

    // PC: barra lateral a la izquierda.
    if (esPantallaAncha(context)) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _indice,
              onDestinationSelected: _cambiar,
              labelType: NavigationRailLabelType.all,
              backgroundColor: Colors.white,
              indicatorColor: AppColors.primarioClaro,
              leading: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primario,
                  child: Icon(Icons.recycling, color: Colors.white),
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Inicio'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.location_on_outlined),
                  selectedIcon: Icon(Icons.location_on),
                  label: Text('Centros'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.menu_book_outlined),
                  selectedIcon: Icon(Icons.menu_book),
                  label: Text('Guía'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bar_chart_outlined),
                  selectedIcon: Icon(Icons.bar_chart),
                  label: Text('Avance'),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: contenido),
          ],
        ),
      );
    }

    // Celular: barra inferior.
    return Scaffold(
      body: contenido,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: _cambiar,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.location_on_outlined),
            selectedIcon: Icon(Icons.location_on),
            label: 'Centros',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Guía',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Avance',
          ),
        ],
      ),
    );
  }
}
