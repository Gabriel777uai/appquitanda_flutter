import 'package:Greengrocer/src/pages/auth/singn_in_screen.dart';
import 'package:Greengrocer/src/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greengrocer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

