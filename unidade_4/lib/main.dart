import 'package:flutter/material.dart';
import 'package:unidade_4/screens/book_add.dart';

void main() {
  runApp(LibraryApp());
}

class LibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookAdd(),
    );
  }
}
