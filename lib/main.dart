import 'package:flutter/material.dart';
import 'package:psychologicaltest_flutter_app/Screens/entry_test.dart';
import 'package:psychologicaltest_flutter_app/Screens/home.dart';
import 'package:psychologicaltest_flutter_app/Screens/psychological_result.dart';
import 'package:psychologicaltest_flutter_app/Screens/psychological_test.dart';

void main() {
  runApp(const MyApp());
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
        '/entry': (context) => const EntryTestScreen(),
        '/test': (context) => const PsychologicalTestScreen(),
        '/result': (context) => const PsychologicalResultScreen(),
      },
    );
  }
}
