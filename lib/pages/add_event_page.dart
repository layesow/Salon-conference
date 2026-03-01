import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

// clé pour le formulaire
final _formKey = GlobalKey<FormState>(); // clé pour le formulaire

// contrôleurs pour les champs de texte
final confNameController = TextEditingController(); // contrôleur pour le champ de texte du nom de la conférence
final speakerNameController = TextEditingController(); // contrôleur pour le champ de texte du nom du speaker
String selectedConfType = "Talk"; // variable pour stocker le type de conférence sélectionné
DateTime selectedConfDate = DateTime.now(); // variable pour stocker la date sélectionnée

// libération des ressources
@override
  void dispose() {
    super.dispose();
    confNameController.dispose(); // libération du contrôleur du champ de texte du nom de la conférence
    speakerNameController.dispose(); // libération du contrôleur du champ de texte du nom du speaker
  }

  @override
Widget build(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Titre de la conférence",
                  hintText: "Entrez le titre de la conférence",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un titre';
                  }
                  return null;
                },
                controller: confNameController, // assignation du contrôleur au champ de texte du nom de la conférence
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nom du conférencier",
                    hintText: "Entrez le nom du speaker",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer le nom du speaker';
                    }
                    return null;
                  },
                  controller: speakerNameController, // assignation du contrôleur au champ de texte du nom du speaker
                ),
              ),
            Container(
                  margin: const EdgeInsets.only(bottom: 20),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem( value: "Talk",child: Text("Talk show")),
                    DropdownMenuItem( value: "Demo",child: Text("Demo code")),
                    DropdownMenuItem( value: "Partener",child: Text("Partener")),
                  ],
                  decoration: const InputDecoration(
                    labelText: "Type de conférence",
                    border: OutlineInputBorder(),
                  ),
                  value: selectedConfType,
                  onChanged: (value) {
                    setState(() {
                      selectedConfType = value!; // mise à jour du type de conférence sélectionné
                    });
                    // ignore: avoid_print
                    print("Type de conférence sélectionné : $value");
                  },
                ),
              ),

            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Choisir une date',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == 1 ? 'Ne peut pas être le premier jour du mois' : null,
                  onChanged: (DateTime? value) {
                    // ignore: avoid_print
                    setState(() {
                      selectedConfDate = value!; // mise à jour de la date sélectionnée
                    });
                  },
                ),
              ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // couleur du bouton
                  foregroundColor: Colors.white, // couleur du texte
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    final confName = confNameController.text; // récupération du texte du champ de texte du nom de la conférence
                    final speakerName = speakerNameController.text; // récupération du texte du champ de texte du nom du speaker
                    
                    // Si le formulaire est valide, afficher un message de succès
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Conférence enregistrée')),
                    );
                    FocusScope.of(context).unfocus(); // fermer le clavier

                    /* // ignore: avoid_print
                    print ("Ajout de la conférence : $confName, par le Speaker : $speakerName"); // affichage dans la console du nom de la conférence et du nom du speaker
                    // ignore: avoid_print
                    print ("Type de conférence : $selectedConfType"); // affichage dans la console du type de conférence sélectionné
                    // ignore: avoid_print
                    print ("Date de la conférence : $selectedConfDate"); // affichage dans la console de la date sélectionnée
                    */

                    // ajout dans la base de données firebase
                    CollectionReference eventsRef = FirebaseFirestore.instance.collection('Events');
                    eventsRef.add({
                      'speaker': speakerName,
                      'date': selectedConfDate,
                      'type': selectedConfType,
                      'subject': confName,
                      'avatar': 'lior' // avatar par défaut,
                    }).then((value) => print("Conférence ajoutée avec succès"))
                    .catchError((error) => print("Erreur lors de l'ajout de la conférence : $error"));

                  }
                }, 
                child: const Text("Enregistrer")
              ),
            )
            
          ],
          ),
        ),
      ),
    ),
  );
}}