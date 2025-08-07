import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import 'reader_page.dart';

class HomePage extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: "Les Misérables",
      author: "Victor Hugo",
      filePath: "assets/books/les_miserables.pdf",
      coverImage: "assets/covers/les_miserables.jpg",
    ),
    Book(
      title: "Harry Potter à l'école des sorciers",
      author: "J.K. Rowling",
      filePath: "assets/books/HP1.pdf",
      coverImage: "assets/covers/hp1.jpg",
    ),
    Book(
      title: "Harry Potter et la Chambre des Secrets",
      author: "J.K. Rowling",
      filePath: "assets/books/HP2.pdf",
      coverImage: "assets/covers/hp2.jpg",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ma Bibliothèque")),
      body: GridView.builder(
        itemCount: books.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          final book = books[index];
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
