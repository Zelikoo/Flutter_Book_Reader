import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(EbookReaderApp());

class EbookReaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eBook Reader',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
