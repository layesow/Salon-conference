import 'package:flutter/material.dart';

class AddEventPage extends StatelessWidget {
  const AddEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Ajouter un événement",
        style: TextStyle(
          fontSize: 24
        ),
      ),
    );
  }
}