import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: Image.asset(book.coverImage, fit: BoxFit.cover)),
          ListTile(
            title: Text(book.title, style: TextStyle(fontSize: 14)),
            subtitle: Text(book.author, style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
