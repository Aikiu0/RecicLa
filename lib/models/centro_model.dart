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
    nombre: 'Acopio Pachuca PetStar',
    direccion: 'Epazoyucan, Hgo.',
    horario: 'Lun a Vie 9:00 a 17:00',
    imagen: 'centro_01.png',
    materiales: ['Papel', 'Cartón'],
  ),
  Centro(
    id: 2,
    nombre: 'RECICLADORA PERCHA',
    direccion: 'Blvd. Ramón G. Bonfil 6, Pachuca',
    horario: 'Lun a Sab 8:00 a 14:00',
    imagen: 'centro_02.png',
    materiales: ['Plástico', 'Vidrio', 'Metal'],
  ),
  Centro(
    id: 3,
    nombre: 'RECICLUM',
    direccion: 'Blvd. Felipe Angeles 1604, Santa Julia',
    horario: 'Lun a Vie 8:00 a 15:00',
    imagen: 'centro_03.png',
    materiales: ['Plástico', 'Papel'],
  ),
  Centro(
    id: 4,
    nombre: 'Recicladora Dos7',
    direccion: 'C. 19 de Junio 214, San Pedro Nopancalco',
    horario: 'Sab y Dom 9:00 a 13:00',
    imagen: 'centro_04.png',
    materiales: ['Electrónicos', 'Metal'],
  ),
  Centro(
    id: 5,
    nombre: 'Grupo Continental Pet',
    direccion: 'Pachuca - Sahagún Parque Industrial Km 5.3 35',
    horario: 'Lun a Vie 10:00 a 18:00',
    imagen: 'centro_05.png',
    materiales: ['Vidrio', 'Cartón'],
  ),
];
