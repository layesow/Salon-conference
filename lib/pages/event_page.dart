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
      body: const Center(
        child: Text("Planning de l'événement à venir..."),
      ),
    );
  }
}