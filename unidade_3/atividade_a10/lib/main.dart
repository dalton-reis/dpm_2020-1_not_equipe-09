import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart'; // Pacote para utilização do Acelerômetro
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Definição de variáveis de posição, texto, eventos e cores
  double offX = 0;
  double offY = 0;
  String buttonText;
  var accelerE;
  var accelerEv;
  int timeInside = 0;
  var purpleColor = Color.fromRGBO(120, 2, 255, 0.8);
  var greenColor = Color.fromRGBO(0, 255, 0, 0.8);
  var blColor = Color.fromRGBO(0, 120, 120, 0.8);
  var currentColor = Color.fromRGBO(120, 2, 255, 0.8);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      // Deixa a orientação do dispositivo como Retrato
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Pegar a largura da tela do dispositivo
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Usando acelerômetro em Flutter"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              // Posição do círculo
              top: 0.3 * width + offY,
              left: 0.3 * width - offX,
              child: Container(
                // Tamanho do círculo
                height: 0.4 * width,
                width: 0.4 * width,
                decoration: BoxDecoration(
                    // Arredondamento do círculo
                    borderRadius: BorderRadius.circular(0.2 * width),
                    // Cor do círculo
                    color: blColor),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (accelerE != null) {
            if (accelerE.isPaused) {
              buttonText = "Pause";
              accelerE.resume();
            } else {
              buttonText = "Continuar";
              accelerE.pause();
            }
          } else {
            buttonText = "Pause";
            accelerE = accelerometerEvents.listen((AccelerometerEvent event) {
              setState(() {
                accelerEv = event;
              });
            });
          }
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 0.02 * width),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}