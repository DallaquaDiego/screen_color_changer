import 'package:flutter/material.dart';

import 'home_screen.dart';

// Entry point of the Flutter application
void main() {
  runApp(const MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Sets the initial screen of the app
      home: HomeScreen(),
      // Hides the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}
