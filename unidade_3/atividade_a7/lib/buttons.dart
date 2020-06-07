import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

var flat_button = new FlatButton(
  child: Text('Scan'),
  color: Colors.blueAccent,
  textColor: Colors.white,
  onPressed: () {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

    // Stop scanning
    flutterBlue.stopScan();
  },
);
