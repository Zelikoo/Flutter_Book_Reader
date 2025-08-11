import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import 'reader_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addBook_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance;
  final List<Book> booksList = [];

  void initState() {
    super.initState();
    getBooks();
  }

  void getBooks() async {
    final booksSnapshot = await _firestore.collection('Book').get();

    final loadedBooks = booksSnapshot.docs.map((book) {
      return Book(
        title: book.get('title'),
        author: book.get('author'),
        filePath: book.get('url_book'),
        coverImage: book.get('url_cover'),
      );
    }).toList();

    setState(() {
      booksList.clear();
      booksList.addAll(loadedBooks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ma Bibliothèque"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddBookPage()),
            ).then((_) => setState(() {
                  booksList.clear();
                  getBooks();
                })),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: booksList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          final book = booksList[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ReaderPage(book: book),
              ),
            ),
            child: BookCard(book: book),
          );
        },
      ),
    );
  }
}
