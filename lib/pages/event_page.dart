import 'package:flutter/material.dart';


class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final events = [
    {
      "speaker": "La technologie",
      "date": "10h00 - 12h00",
      "subject": "Conférence d'ouverture",
      "avatar": "lior"
    },
    {
      "speaker": "Intelligence Artificielle",
      "date": "17h00 - 18h00",
      "subject": "Conférence de clôture",
      "avatar": "damien"
    },
    {
      "speaker": "Informatique ",
      "date": "14h00 - 15h00",
      "subject": "Atelier Flutter",
      "avatar": "defendintelligence"
    },


  ];

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
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            final avatar = event["avatar"]!;
            final speaker = event["speaker"]!;
            final date = event["date"]!;
            final subject = event["subject"]!;


            return Card(
              child: ListTile(
                leading: Image.asset("assets/images/$avatar.jpg"),
                title: Text('$speaker ($date)'),
                subtitle: Text(subject),
                trailing: const Icon(Icons.more_vert),
              ),
            );

          },
        )
      ),
    );
  }
}