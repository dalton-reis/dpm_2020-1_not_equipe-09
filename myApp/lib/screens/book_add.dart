import 'package:flutter/material.dart';

import '../database/dao/book_dao.dart';
import '../models/book.dart';

class BookAdd extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAuthor = TextEditingController();
  final TextEditingController _controllerStatus = TextEditingController();

  final BookDao _dao = BookDao();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Theme.of(context).primaryColor,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sub Page'),
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controllerName,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controllerAuthor,
                  decoration: InputDecoration(labelText: 'Autor'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controllerStatus,
                  decoration: InputDecoration(labelText: 'Status'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text('Cadastrar'),
                  onPressed: () {
                    final String name = _controllerName.text;
                    final String author = _controllerAuthor.text;
                    final String status = _controllerStatus.text;

                    final Book newBook = Book(0, name, author, status);
                    _dao.save(newBook);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
