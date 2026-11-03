import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'data/repositories/local_center_repository.dart';
import 'features/splash/splash_screen.dart';
import 'providers/centers_provider.dart';
import 'providers/favorites_provider.dart';
import 'providers/tracking_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CentersProvider(LocalCenterRepository())..cargar(),
        ),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => TrackingProvider()),
      ],
      child: const RecicLaApp(),
    ),
  );
}

class RecicLaApp extends StatelessWidget {
  const RecicLaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecicLa',
      debugShowCheckedModeBanner: false,
      theme: buildRecicLaTheme(),
      home: const SplashScreen(),
    );
  }
}
