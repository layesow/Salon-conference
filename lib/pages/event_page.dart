import 'package:flutter/material.dart';


class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
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
            
          ],
        )
      ),
    );
  }
}