import 'package:flutter/material.dart';

import 'screens/metro_screen.dart';

void main() {
  runApp(const MetroRouteApp());
}

class MetroRouteApp extends StatelessWidget {
  const MetroRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metro Route',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1016),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF32D583),
          brightness: Brightness.dark,
        ),
      ),
      home: const MetroScreen(),
    );
  }
}