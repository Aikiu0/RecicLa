import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/widgets/adaptable.dart';
import '../../core/widgets/custom_button.dart';
import '../shell/main_shell.dart';

class _Pagina {
  final IconData icono;
  final String titulo;
  final String texto;
  const _Pagina(this.icono, this.titulo, this.texto);
}

const List<_Pagina> _paginas = [
  _Pagina(
    Icons.location_on,
    'Encuentra centros',
    'Busca centros de acopio en Pachuca y filtra por material.',
  ),
  _Pagina(
    Icons.menu_book,
    'Aprende a separar',
    'Consulta cómo preparar cada residuo antes de llevarlo.',
  ),
  _Pagina(
    Icons.bar_chart,
    'Mide tu avance',
    'Registra cuántos kilos reciclas y mira tu total.',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _pagina = 0;

  bool get _esUltima => _pagina == _paginas.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _irAlInicio() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }

  void _siguiente() {
    if (_esUltima) {
      _irAlInicio();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ContenidoCentrado(
          anchoMaximo: 480,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _irAlInicio,
                    child: const Text('Saltar'),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _paginas.length,
                    onPageChanged: (i) => setState(() => _pagina = i),
                    itemBuilder: (context, i) => _buildPagina(_paginas[i]),
                  ),
                ),
                _buildPuntos(),
                const SizedBox(height: 24),
                CustomButton(
                  texto: _esUltima ? 'Comenzar' : 'Siguiente',
                  onPressed: _siguiente,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPagina(_Pagina p) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            color: AppColors.primarioClaro,
            shape: BoxShape.circle,
          ),
          child: Icon(p.icono, size: 96, color: AppColors.primario),
        ),
        const SizedBox(height: 24),
        Text(
          p.titulo,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        Text(
          p.texto,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildPuntos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _paginas.length; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: i == _pagina ? 20 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: i == _pagina ? AppColors.primario : Colors.black26,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    );
  }
}
