import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.blueAccent,
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent, 
            textTheme: ButtonTextTheme.primary),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
      // home: ContactList(),
    );
  }
}
