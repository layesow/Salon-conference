import 'package:flutter/material.dart';
import 'package:salonconf/pages/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sallon-Conf",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue, // couleur de l'icône sélectionnée
          unselectedItemColor: Colors.grey, // couleur des icônes non sélectionnées
          iconSize: 32, // taille des icônes
          elevation: 10, // ombre

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

