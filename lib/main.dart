import 'package:flutter/material.dart';
import 'package:salonconf/pages/add_event_page.dart';
import 'package:salonconf/pages/event_page.dart';
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

  int _currentIndex = 0; // index de l'onglet sélectionné
  
  setSelectedIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
        body: [
          const HomePage(),
          const EventPage(),
          const AddEventPage()
        ][_currentIndex], // affiche la page correspondant à l'index sélectionné

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // index de l'onglet sélectionné
          onTap: setSelectedIndex, // fonction appelée lors du tap sur un onglet

          
          selectedItemColor: Colors.blue, // couleur de l'icône sélectionnée
          unselectedItemColor: Colors.grey, // couleur des icônes non sélectionnées
          iconSize: 32, // taille des icônes
          elevation: 10, // ombre
          type: BottomNavigationBarType.fixed, // type de navigation

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Accueil"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Planning"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Ajouter"
            ),
          ],
        ),
      ),
    );
  }

}

