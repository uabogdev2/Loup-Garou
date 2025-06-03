import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/themes/app_theme.dart';
import 'core/themes/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (context, controller, _) {
          return MaterialApp(
            title: 'Cercle Mystique',
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: controller.mode,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cercle Mystique'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: controller.toggle,
          ),
        ],
      ),
      body: const Center(
        child: Text('Bienvenue dans Cercle Mystique!'),
      ),
    );
  }
}
