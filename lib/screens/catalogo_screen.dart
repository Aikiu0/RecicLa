import 'package:flutter/material.dart';

import '../core/centro_card.dart';
import '../models/centro_model.dart';
import '../data/centro_repo.dart';
import 'detalle_screen.dart';

class CatalogoScreen extends StatefulWidget {
  final String materialInicial;

  const CatalogoScreen({super.key, this.materialInicial = 'Todos'});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Centro> centros = CentroRepo().obtenerCentros();
  String matSelec = 'Todos';
  String texBus = '';

  @override
  void initState() {
    super.initState();
    matSelec = widget.materialInicial;
  }

  List<Centro> get centrosFiltrados {
    return centros.where((centro) {
      final coincideMaterial =
          matSelec == 'Todos' || centro.materiales.contains(matSelec);
      final coincideBusqueda = centro.nombre.toLowerCase().contains(
        texBus.toLowerCase(),
      );
      return coincideMaterial && coincideBusqueda;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtros = ['Todos'] + materialesDemo;
    final lista = centrosFiltrados;

    return Scaffold(
      appBar: AppBar(title: const Text('Centros de acopio')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar por nombre...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (texto) {
                    setState(() {
                      texBus = texto;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: filtros.map((material) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(material),
                        selected: material == matSelec,
                        onSelected: (_) {
                          setState(() {
                            matSelec = material;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${lista.length} centros'),
                ),
              ),
              Expanded(
                child: lista.isEmpty
                    ? const Center(
                        child: Text('No encontramos centros con esos filtros'),
                      )
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: lista.map((centro) {
                          return CentroCard(
                            nombre: centro.nombre,
                            direccion: centro.direccion,
                            materiales: centro.materiales.join(', '),
                            rutaImagen: centro.rutaImagen,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetalleScreen(centro: centro),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
