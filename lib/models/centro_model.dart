const String kRutaImagenes = 'assets/images/';

class Centro {
  final int id;
  final String nombre;
  final String direccion;
  final String horario;
  final String imagen;
  final List<String> materiales;

  const Centro({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.horario,
    required this.imagen,
    required this.materiales,
  });

  String get rutaImagen => '$kRutaImagenes$imagen';
}

const List<String> materialesDemo = [
  'Plástico',
  'Vidrio',
  'Papel',
  'Cartón',
  'Metal',
  'Electrónicos',
];

const List<Centro> centrosDemo = [
  Centro(
    id: 1,
    nombre: 'Centro de acopio ejemplo 1',
    direccion: 'Col. Centro, Pachuca (por confirmar)',
    horario: 'Lun a Vie 9:00 a 17:00',
    imagen: 'centro_01.png',
    materiales: ['Papel', 'Cartón'],
  ),
  Centro(
    id: 2,
    nombre: 'Centro de acopio ejemplo 2',
    direccion: 'Col. Periodistas, Pachuca (por confirmar)',
    horario: 'Lun a Sab 8:00 a 14:00',
    imagen: 'centro_02.png',
    materiales: ['Plástico', 'Vidrio', 'Metal'],
  ),
  Centro(
    id: 3,
    nombre: 'Centro de acopio ejemplo 3',
    direccion: 'Col. Morelos, Pachuca (por confirmar)',
    horario: 'Lun a Vie 8:00 a 15:00',
    imagen: 'centro_03.png',
    materiales: ['Plástico', 'Papel'],
  ),
  Centro(
    id: 4,
    nombre: 'Centro de acopio ejemplo 4',
    direccion: 'Mineral de la Reforma (por confirmar)',
    horario: 'Sab y Dom 9:00 a 13:00',
    imagen: 'centro_04.png',
    materiales: ['Electrónicos', 'Metal'],
  ),
  Centro(
    id: 5,
    nombre: 'Centro de acopio ejemplo 5',
    direccion: 'Col. Doctores, Pachuca (por confirmar)',
    horario: 'Lun a Vie 10:00 a 18:00',
    imagen: 'centro_05.png',
    materiales: ['Vidrio', 'Cartón'],
  ),
  Centro(
    id: 6,
    nombre: 'Centro de acopio ejemplo 6',
    direccion: 'Col. Cubitos, Pachuca (por confirmar)',
    horario: 'Lun a Sab 9:00 a 14:00',
    imagen: 'centro_06.png',
    materiales: ['Plástico', 'Metal'],
  ),
  Centro(
    id: 7,
    nombre: 'Centro de acopio ejemplo 7',
    direccion: 'Col. Real de Minas, Pachuca (por confirmar)',
    horario: 'Mar a Sab 9:00 a 16:00',
    imagen: 'centro_07.png',
    materiales: ['Papel', 'Cartón', 'Vidrio'],
  ),
  Centro(
    id: 8,
    nombre: 'Centro de acopio ejemplo 8',
    direccion: 'Col. Santa Julia, Pachuca (por confirmar)',
    horario: 'Lun a Vie 8:00 a 14:00',
    imagen: 'centro_08.png',
    materiales: ['Electrónicos'],
  ),
  Centro(
    id: 9,
    nombre: 'Centro de acopio ejemplo 9',
    direccion: 'Col. Juan C. Doria, Pachuca (por confirmar)',
    horario: 'Lun a Dom 7:00 a 13:00',
    imagen: 'centro_09.png',
    materiales: ['Plástico', 'Vidrio', 'Papel', 'Cartón'],
  ),
  Centro(
    id: 10,
    nombre: 'Centro de acopio ejemplo 10',
    direccion: 'Col. Piracantos, Pachuca (por confirmar)',
    horario: 'Lun a Vie 9:00 a 17:00',
    imagen: 'centro_10.png',
    materiales: ['Metal', 'Cartón'],
  ),
];
