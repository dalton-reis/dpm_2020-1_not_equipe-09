import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorAutor = TextEditingController();
  final TextEditingController _controladorData = TextEditingController();
  final TextEditingController _controladorEditora = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastrando obra'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          children: <Widget>[
            TextField( controller: _controladorTitulo, decoration: InputDecoration(labelText: 'Título'),),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField( controller: _controladorAutor, decoration: InputDecoration(labelText: 'Autor'),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField( controller: _controladorData, decoration: InputDecoration(labelText: 'Data de publicação'), keyboardType: TextInputType.number,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(controller: _controladorEditora, decoration: InputDecoration(labelText: 'Editora'),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  final String titulo = _controladorTitulo.text;
                  final String autor = _controladorAutor.text;
                  final String data = _controladorData.text;
                  final String editora = _controladorEditora.text;

                  final Obra novaObra = Obra(titulo, autor, data, editora);
                  print(novaObra);
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

class Obra {
  final String titulo;
  final String autor;
  final String dataPubli;
  final String editora;

  Obra(
    this.titulo,
    this.autor,
    this.dataPubli,
    this.editora,
  );

  @override
  String toString() {
    return 'Obra{titulo: $titulo, autor: $autor, data: $dataPubli, editora: $editora}';
  }  
}