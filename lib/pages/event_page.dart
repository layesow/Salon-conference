import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planning de l'événement"
          , style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Image.asset('assets/images/damien.jpg'),
                title: const Text("Damien de 17h00 à 18h00"),
                subtitle: const Text("10h00 - 12h00 : Conférence d'ouverture"),
                trailing: const Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/images/defendintelligence.jpg'),
                title: const Text("Defendintelligence de 17h à 18h"),
                subtitle: const Text("14h00 - 16h00 : Ateliers pratiques"),
                trailing: const Icon(Icons.more_vert),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.asset('assets/images/lior.jpg'),
                title: const Text("Lior de 17h à 18h"),
                subtitle: const Text("16h00 - 18h00 : Clôture et réseautage"),
                trailing: const Icon(Icons.more_vert),
              ),
            ),
          ],
        )
      ),
    );
  }
}