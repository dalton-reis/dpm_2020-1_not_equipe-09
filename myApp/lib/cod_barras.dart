import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class CodBarras extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScanScreen(),
    );
  }
}

class ScanScreen extends StatefulWidget {
  @override
  ScanState createState() => new ScanState();
}

class ScanState extends State<ScanScreen> {
  String barcode = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  // TODO: implement widget
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Escaneador"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0),
              child: RaisedButton(
                color: Colors.purple,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: scan,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.scanner, size:40,),
                    SizedBox(height: 2,),
                    Text("Aperte aqui para escanear")
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(barcode, textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String baseUrl = "https://www.googleapis.com/books/v1/volumes?q=isbn:";
      String barcode = await BarcodeScanner.scan();

      HttpClientRequest request = await HttpClient().getUrl(Uri.parse(baseUrl+barcode));
      var response = await request.close();
      var result = new StringBuffer();
      await for (var contents in response.transform(Utf8Decoder())) {
        print(contents);
        result.write(contents);
      }
      Map<String,dynamic> mapResultado = jsonDecode(result.toString());
      print(mapResultado.keys);
      if (mapResultado["totalItems"] == 0) {
        barcode = "Codigo de barras nao encontrado " + barcode;
      } else {
        Map<String,dynamic> item = mapResultado["items"][0];
        Map<String,dynamic> livro = item["volumeInfo"];
        print(livro.keys);
        if (livro.containsKey("title")) {
          if (livro.containsKey("subtitle")) {
            barcode = livro["title"] + " - " + livro["subtitle"];
          } else {
            barcode = livro["title"];
          }
        }
      }
      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException catch(e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = "Acesso da camera negado";
        });
      } else {
        setState(() {
          this.barcode = "Erro desconhecido";
        });
      }
    } on FormatException catch(e){
      print(e);
      setState(() {
        this.barcode = "null (reorno do usuario antes de ter sido escaneado algo)";
      });
    } catch (e) {
      setState(() {
        this.barcode = "Erro desconhecido: $e";
      });
    }
  }
}
