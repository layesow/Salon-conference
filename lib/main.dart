import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          
          title: const Text('Sallon-Conf'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sallon-Conf",
                style: TextStyle(
                  fontSize: 42
                ),
              ),
              Text(
                "Sallon de virtualisation de conférence du 21 au 23 juin 2026",
                style: TextStyle(
                  fontSize: 24
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}