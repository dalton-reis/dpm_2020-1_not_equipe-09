import 'package:flutter/material.dart';

import '../database/dao/book_dao.dart';
import '../models/book.dart';

class BookGet extends StatelessWidget {

  final BookDao _dao = BookDao();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Theme.of(context).primaryColor,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consultar Livros'),
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text('Consultar'),
                  onPressed: () async {
                    var lista = await _dao.findAll();
                    print(lista);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//  Widget _buildSuggestions() {
//    return ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemBuilder: (context, i) {
//          if (i.isOdd) return Divider();
//
//          final index = i~/2;
//          if (index >= _suggestions.length) {
//            _suggestions.addAll(generateWordPairs().take(10));
//          }
//          return _buildRow(_suggestions[index]);
//        });
//  }
//
//  Widget _buildRow () {
//    return ListTile (
//      title: Text (
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//    );
//  }

}
