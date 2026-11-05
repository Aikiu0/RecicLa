# RecicLa

App para facilitar el reciclaje en Pachuca, Hidalgo. Ayuda a encontrar centros de acopio según el material, explica cómo preparar cada residuo antes de llevarlo y deja registrar cuántos kilos recicla el usuario para que vea su avance.


## Equipo

1. Alejandro Sánchez Ramírez (Integrante 1): catálogo de centros, búsqueda, filtro por material y detalle del centro.
2. Alessandra Segovia Villanueva (Integrante 2): favoritos y guía de materiales.
3. Xocoyotzin Emmanuel Tapia López (Integrante 3): splash, bienvenida, inicio y seguimiento de kilos.

## Problema que resuelve
Notamos que en la ciudad hay mucha basura en las calles, parques, etc, por lo que se nos ocurrió la idea de esta app, ya que yo (Alejandro) tengo una conocida que se dedica a reciclar y por ella sé que a veces la gente quiere reciclar pero no sabe como separar/preparar la basura correctamente o en donde dejarla

## Instalación y ejecución

Requisitos: Flutter instalado, Git y vscode.

1. Clonar el repositorio:

git clone https://github.com/Aikiu0/RecicLA.git
cd RecicLA

2. Descargar las dependencias:

flutter pub get

3. Revisar que no haya errores:
flutter analyze

4. Correr la app:

flutter run
flutter run -d chrome

## Estructura del proyecto

```
lib/
  main.dart                 arranca la app y crea el Provider
  recicla_provider.dart     estado compartido: favoritos y registros
  core/
    core_theme.dart         colores, espacios y tema global
    custom_button.dart      botón reutilizable
    centro_card.dart        tarjeta reutilizable de un centro
    opcion_chip.dart        opción seleccionable para filtrar
  models/
    centro_model.dart       modelo Centro y datos de los centros
    guia_model.dart         modelo GuiaMaterial y datos de la guía
    registro_model.dart     modelo Registro
  data/
    centro_repo.dart        repositorio: entrega y filtra los centros
  screens/
    splash_screen.dart
    onboarding_screen.dart
    home_screen.dart
    catalogo_screen.dart
    detalle_screen.dart
    favoritos_screen.dart
    guia_screen.dart
    seguimiento_screen.dart
assets/images/              logo e imágenes de los centros
```

## Decisiones técnicas

Carpetas  `core` tiene lo que comparte toda la app, `models` los datos, `data` de dónde salen y `screens` lo que ve el usuario. Así cada archivo está donde uno lo buscaría.

 Las pantallas no leen la lista de centros directamente, se la piden a `CentroRepo`. El filtro por texto y material vive en el repositorio y no en la pantalla.

`ReciclaProvider` guarda lo que usan varias pantallas: los favoritos (Inicio, Detalle y Favoritos) y los registros de kilos (Inicio y Seguimiento). Las pantallas usan `context.watch` para mostrar y `context.read` para cambiar. Lo que solo le importa a una pantalla, como el texto del buscador o el material elegido, se maneja con `setState`.

`agregarRegistro` revisa que los kilos no estén vacíos, que sean número y que sean mayores que 0. Regresa el mensaje de error o nada si todo está bien, y la pantalla solo lo muestra.

Se usa `Navigator.push` con `MaterialPageRoute`. El centro se pasa al Detalle por el constructor y la Guía abre el Catálogo ya filtrado mandándole el material.

Los colores y estilos están en `core_theme.dart`. `CustomButton`, `CentroCard` y `OpcionChip` se reusan en varias pantallas para no repetir código.

Los centros y la guía están escritos en el código y los favoritos y registros viven en memoria mientras la app está abierta. 

## Backlog

### Must (Etapa 2)

1. Guardar favoritos y registros para que no se pierdan al cerrar la app.
2. Leer los centros desde Firebase en lugar de tenerlos en el código.
3. Inicio de sesión para que cada usuario tenga su propio seguimiento.

### Should

1. Mapa con la ubicación de cada centro y botón para abrir la ruta.
2. Gráfica de kilos reciclados por material.
3. Poner la fuente real en la Guía de materiales.

### Could

1. Recordatorios para llevar el reciclaje.
2. Logros o insignias por nivel.
3. Compartir el avance en redes sociales.

## Uso de IA

Lo que se hizo con apoyo de herramientas de IA está registrado en AI_LOG.md.

## Flujo de trabajo con Git

Cada integrante trabajó en su propia rama (feature/centros, feature/favoritos y feature/seguimiento) y se integró a main con Pull Requests. La simplificación final se hizo en refactor/estructura-simple.
