import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/adaptable.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/tarjeta_avance.dart';
import '../../models/recycle_entry.dart';
import '../../models/tipo_material.dart';
import '../../providers/tracking_provider.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _kilosController = TextEditingController();
  TipoMaterial? _material;

  @override
  void dispose() {
    _kilosController.dispose();
    super.dispose();
  }

  String? _validarKilos(String? valor) {
    if (valor == null || valor.trim().isEmpty) {
      return 'Escribe cuántos kilos';
    }
    final numero = double.tryParse(valor.trim().replaceAll(',', '.'));
    if (numero == null) {
      return 'Escribe solo números, por ejemplo 1.5';
    }
    if (numero <= 0) {
      return 'Debe ser mayor que 0';
    }
    return null;
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    final kilos = double.parse(
      _kilosController.text.trim().replaceAll(',', '.'),
    );
    context.read<TrackingProvider>().agregar(
      RecycleEntry(material: _material!, kilos: kilos, fecha: DateTime.now()),
    );
    _kilosController.clear();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Registro guardado')));
  }

  @override
  Widget build(BuildContext context) {
    final tracking = context.watch<TrackingProvider>();
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Mi seguimiento')),
      body: ContenidoCentrado(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              color: Colors.white,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nuevo registro', style: textos.titleMedium),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<TipoMaterial>(
                        initialValue: _material,
                        decoration: const InputDecoration(
                          labelText: 'Material',
                        ),
                        items: [
                          for (final m in TipoMaterial.values)
                            DropdownMenuItem(value: m, child: Text(m.etiqueta)),
                        ],
                        onChanged: (m) => setState(() => _material = m),
                        validator: (m) =>
                            m == null ? 'Elige un material' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _kilosController,
                        decoration: const InputDecoration(
                          labelText: 'Kilos',
                          hintText: 'Ej. 1.5',
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        validator: _validarKilos,
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        texto: 'Registrar',
                        icono: Icons.add,
                        onPressed: _guardar,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TarjetaAvance(titulo: 'Total reciclado'),
            const SizedBox(height: 24),
            Text('Historial', style: textos.titleMedium),
            const SizedBox(height: 8),
            if (tracking.registros.isEmpty)
              const Text('Todavía no registras nada.')
            else
              for (final r in tracking.registros.reversed)
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.primarioClaro,
                      child: Icon(Icons.recycling, color: AppColors.primario),
                    ),
                    title: Text(r.material.etiqueta),
                    subtitle: Text(
                      '${r.fecha.day}/${r.fecha.month}/${r.fecha.year}',
                    ),
                    trailing: Text(
                      '${r.kilos} kg',
                      style: textos.titleMedium?.copyWith(
                        color: AppColors.primario,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
