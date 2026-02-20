import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset('assets/images/logo.svg'),
              SvgPicture.asset(
                'assets/images/logo.svg',
                // ignore: deprecated_member_use
                color: Colors.blue
              ),
              const Text("Sallon-Conf",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 42
                ),
              ),
              const Text("Sallon de virtualisation de conférence du 21 au 23 Avril 2026",
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