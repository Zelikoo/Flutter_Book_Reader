import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../models/book.dart';

class ReaderPage extends StatelessWidget {
  final Book book;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  ReaderPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [
          IconButton(
              onPressed: () {
                _pdfViewerKey.currentState?.openBookmarkView();
              },
              icon: Icon(Icons.bookmark))
        ],
      ),
      body: SfPdfViewer.network(
        book.filePath,
        key: _pdfViewerKey,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          _pdfViewerKey.currentState?.openBookmarkView();
        },
        child: Icon(Icons.bookmark),
      ),
    );
  }
}
