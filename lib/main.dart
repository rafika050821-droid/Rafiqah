import 'package:flutter/material.dart';
import 'splash/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PengingatObatApp());
}

class PengingatObatApp extends StatelessWidget {
  const PengingatObatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pengingat Obat',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
