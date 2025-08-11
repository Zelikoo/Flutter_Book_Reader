import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final urlController = TextEditingController();
  bool loading = false;

  void saveBook() async {
    setState(() => loading = true);
    // final service = BookService();
    // await service.addBookFromUrl(
    //   titleController.text,
    //   authorController.text,
    //   urlController.text,
    // );
    // setState(() => loading = false);
    // Navigator.pop(context);
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
                controller: urlController,
                decoration: InputDecoration(labelText: "URL PDF")),
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
