import 'package:flutter/material.dart';
import 'package:myApp/screens/book_add.dart';

class CadastroScreen extends StatefulWidget {
  @override
  CadastroState createState() => new CadastroState();
}

class CadastroState extends State<CadastroScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  // TODO: implement widget
  Widget build (BuildContext context) {
    return MaterialApp(
      home: BookAdd(),
    );
  }
}

class LibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookAdd(),
    );
  }
}
