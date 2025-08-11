import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final urlBookController = TextEditingController();
  final urlCoverController = TextEditingController();
  bool loading = false;

  void saveBook() async {
    setState(() => loading = true);
    try {
      await FirebaseFirestore.instance.collection("Book").add({
        "title": titleController.text,
        "author": authorController.text,
        "url_book": urlBookController.text,
        "url_cover": urlCoverController.text,
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() => loading = false);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter un livre")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Titre")),
            TextField(
                controller: authorController,
                decoration: InputDecoration(labelText: "Auteur")),
            TextField(
                controller: urlBookController,
                decoration: InputDecoration(labelText: "URL Livre")),
            TextField(
                controller: urlCoverController,
                decoration: InputDecoration(labelText: "URL Couverture")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading ? null : saveBook,
              child: loading
                  ? CircularProgressIndicator()
                  : Text("Télécharger et ajouter"),
            )
          ],
        ),
      ),
    );
  }
}
