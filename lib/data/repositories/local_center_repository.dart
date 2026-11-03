import '../../models/recycling_center.dart';
import '../../models/tipo_material.dart';
import 'center_repository.dart';

class LocalCenterRepository implements CenterRepository {
  @override
  Future<List<RecyclingCenter>> obtenerCentros() async {
    // Simula una espera corta, como si los datos vinieran de internet.
    await Future.delayed(const Duration(milliseconds: 500));
    return _centros;
  }

  static const List<RecyclingCenter> _centros = [
    RecyclingCenter(
      id: 'c01',
      nombre: 'Centro de acopio ejemplo 1',
      direccion: 'Col. Centro, Pachuca (por confirmar)',
      horario: 'Lun a Vie 9:00 a 17:00',
      materiales: [TipoMaterial.papel, TipoMaterial.carton],
      imagen: 'centro_01.png',
    ),
    RecyclingCenter(
      id: 'c02',
      nombre: 'Centro de acopio ejemplo 2',
      direccion: 'Col. Periodistas, Pachuca (por confirmar)',
      horario: 'Lun a Sab 8:00 a 14:00',
      materiales: [
        TipoMaterial.plastico,
        TipoMaterial.vidrio,
        TipoMaterial.metal,
      ],
      imagen: 'centro_02.png',
    ),
  ];
}
