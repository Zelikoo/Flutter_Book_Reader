import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../models/book.dart';

class ReaderPage extends StatelessWidget {
  final Book book;

  ReaderPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SfPdfViewer.asset(book.filePath),
    );
  }
}
