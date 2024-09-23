import 'package:euro_farma_gamify/pages/handout_page.dart';
import 'package:euro_farma_gamify/pages/login_page.dart';
import 'package:euro_farma_gamify/pages/main_page.dart';
import 'package:euro_farma_gamify/pages/quiz_page.dart';
import 'package:euro_farma_gamify/pages/training_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/login": (context) => const LoginPage(),
        "/main": (context) => const MainPage(),
        "/training": (context) => const TrainingPage(),
        "/handout": (context) => const HandoutPage(),
        "/quiz": (context) => const QuizPage(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: backgroundColor,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
