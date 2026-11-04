import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/adaptable.dart';
import '../../core/widgets/lista_centros.dart';
import '../../models/recycling_center.dart';
import '../../models/tipo_material.dart';
import '../../providers/centers_provider.dart';
import 'center_detail_screen.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  void _abrirDetalle(BuildContext context, RecyclingCenter centro) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CenterDetailScreen(centro: centro)),
    );
  }

  Widget _chip(
    BuildContext context,
    String texto,
    TipoMaterial? material,
    TipoMaterial? actual,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(texto),
        selected: actual == material,
        onSelected: (_) => context.read<CentersProvider>().filtrarPor(material),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CentersProvider>();
    final centros = provider.centrosFiltrados;
    final total = centros.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Centros de acopio')),
      body: ContenidoCentrado(
        anchoMaximo: 1000,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextFormField(
                initialValue: provider.busqueda,
                decoration: const InputDecoration(
                  hintText: 'Buscar por nombre',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (texto) =>
                    context.read<CentersProvider>().buscar(texto),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _chip(context, 'Todos', null, provider.filtro),
                  for (final m in TipoMaterial.values)
                    _chip(context, m.etiqueta, m, provider.filtro),
                ],
              ),
            ),
            if (!provider.cargando)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Text(
                  total == 1 ? '1 centro' : '$total centros',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            Expanded(child: _buildLista(context, provider.cargando, centros)),
          ],
        ),
      ),
    );
  }

  Widget _buildLista(
    BuildContext context,
    bool cargando,
    List<RecyclingCenter> centros,
  ) {
    if (cargando) {
      return const Center(child: CircularProgressIndicator());
    }
    if (centros.isEmpty) {
      return const Center(
        child: Text('No encontramos centros con esos filtros.'),
      );
    }
    return ListaCentros(
      centros: centros,
      onTap: (centro) => _abrirDetalle(context, centro),
    );
  }
}
