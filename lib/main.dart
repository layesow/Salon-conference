import 'package:flutter/material.dart';
import 'package:salonconf/pages/home_page.dart';
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
          title: const Text("Sallon-Conf"),
        ),
        body: const HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 32,
          elevation: 10,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Accueil"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Planning"
            ),
          ],
        ),
      ),
    );
  }
}

