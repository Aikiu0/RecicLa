import 'package:flutter/material.dart';

import '../../models/recycling_center.dart';

class CenterDetailScreen extends StatelessWidget {
  final RecyclingCenter centro;
  const CenterDetailScreen({super.key, required this.centro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(centro.nombre)),
      body: const Center(child: Text('TODO: Integrante 1')),
    );
  }
}
