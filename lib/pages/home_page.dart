import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import 'reader_page.dart';

class HomePage extends StatelessWidget {
  final List<Book> books = [
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
    ),
    Book(
      title: "Harry Potter et le Prisonnier d'Azkaban",
      author: "J.K. Rowling",
      filePath: "assets/books/HP3.pdf",
      coverImage: "assets/covers/hp3.png",
    ),
    Book(
      title: "Harry Potter et la Coupe de Feu",
      author: "J.K. Rowling",
      filePath: "assets/books/HP4.pdf",
      coverImage: "assets/covers/hp4.png",
    ),
    Book(
      title: "Harry Potter et l'Ordre du Phénix",
      author: "J.K. Rowling",
      filePath: "assets/books/HP5.pdf",
      coverImage: "assets/covers/hp5.png",
    ),
    Book(
      title: "Harry Potter et le Prince de Sang-Mêlé",
      author: "J.K. Rowling",
      filePath: "assets/books/HP6.pdf",
      coverImage: "assets/covers/hp6.png",
    ),
    Book(
      title: "Harry Potter et les Reliques de la Mort",
      author: "J.K. Rowling",
      filePath: "assets/books/HP7.pdf",
      coverImage: "assets/covers/hp7.png",
    ),
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
