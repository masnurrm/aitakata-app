import 'package:aitakata_app/pages/onboarding_page.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(253, 95, 182, 1),
        ),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
