import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'material_screen.dart';
import 'quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LKPD Kelas 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: 'Comic Sans MS', // Friendly font for kids if available, otherwise fallback
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/material': (context) => const MaterialScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}
