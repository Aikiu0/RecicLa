import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/centro_model.dart';
import '../core/core_theme.dart';
import '../core/custom_button.dart';
import '../recicla_provider.dart';

class SeguimientoScreen extends StatefulWidget {
  const SeguimientoScreen({super.key});

  @override
  State<SeguimientoScreen> createState() => _SeguimientoScreenState();
}

class _SeguimientoScreenState extends State<SeguimientoScreen> {
  final TextEditingController _kilosCtrl = TextEditingController();
  String matSelec = 'Plástico';
  String? error;

  @override
  void dispose() {
    _kilosCtrl.dispose();
    super.dispose();
  }

  void _registrar() {
    final mensaje = context.read<ReciclaProvider>().agregarRegistro(
      matSelec,
      _kilosCtrl.text,
    );
    setState(() => error = mensaje);
    if (mensaje == null) {
      _kilosCtrl.clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registro guardado')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final recicla = context.watch<ReciclaProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Mi seguimiento')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nuevo registro',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text('Material'),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: materialesDemo.map((material) {
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
                    const SizedBox(height: 16),
                    TextField(
                      controller: _kilosCtrl,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Kilos',
                        hintText: 'Ej. 1.5',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    if (error != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                error!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    CustomButton(
                      texto: 'Registrar',
                      icono: Icons.add,
                      onPressed: _registrar,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primarioClaro,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total reciclado'),
                    Text(
                      '${recicla.totalKilos.toStringAsFixed(1)} kg',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      'Nivel: ${recicla.nivel}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primario,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Historial',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              if (recicla.registros.isEmpty)
                const Text('Todavía no registras nada.')
              else
                ...recicla.registros.reversed.map((registro) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.recycling, color: AppColors.primario),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(registro.material),
                              Text(
                                '${registro.fecha.day}/${registro.fecha.month}/${registro.fecha.year}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textoSecundario,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${registro.kilos} kg',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primario,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}
