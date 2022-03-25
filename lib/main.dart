import 'package:flutter/material.dart';
import 'package:foodpedia/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodpedia',
      home:  Splash(),
    );
  }
}

// flutter run --no-sound-null-safety 