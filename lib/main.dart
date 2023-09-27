import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Screens/entry_test.dart';
import 'package:psychologicaltest_flutter_app/Screens/home.dart';
import 'package:psychologicaltest_flutter_app/Screens/psychological_result.dart';
import 'package:provider/provider.dart';
import 'package:psychologicaltest_flutter_app/provider/Quiz_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'psychologicalTest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/result': (context) => const PsychologicalResultScreen(),
      },
    );
  }
}
