import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
            _top(),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Categories:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  Text("View All:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                ],
              )
            ),
            SizedBox(height: 20.0),
            Container(
              height: 200.0,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3/2,
                ),
                children: <Widget>[
                  _gridItem(Icons.airplanemode_active, "Text"),
                  _gridItem(Icons.add_shopping_cart, "Text"),
                  _gridItem(Icons.arrow_drop_down_circle, "Text"),
                  _gridItem(Icons.bluetooth_searching, "Text"),
                  _gridItem(Icons.add_location, "Text"),
                  _gridItem(Icons.arrow_drop_down_circle, "Text"),
                ],
              )
            ),
           /*
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[],
              ),
            )
            */
          ],
        ),
      );
    }
}

_gridItem(icn, text){
  return Column(
    children: <Widget>[
      CircleAvatar(
        child: IconButton(
          icon: Icon(
            icn,
            size: 16.0),
            color: Colors.white,
          onPressed: () => {},
        ),
      backgroundColor: Colors.deepOrange.withOpacity(0.9),
      ),
      SizedBox(height: 10.0),
      Text(
        text,
        style: TextStyle(
          fontSize: 11.0,
        ), 
      )
    ],
  );
}

_top(){
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration:BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(backgroundImage: AssetImage("images/Book.jpg"),
                  ),
                  SizedBox(width: 10.0),
                  Text("Welcome", style: TextStyle(color: Colors.white),),
                ], 
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications, 
                  color: Colors.white), 
                  onPressed: () {},
              )
            ],
          ),
          SizedBox(height: 30.0),
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Colors.white,
              filled: true,
              suffixIcon: Icon(Icons.filter_list),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.transparent),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                ),
            )
        ]
      ),
    );
}
