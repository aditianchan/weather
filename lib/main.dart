import 'package:flutter/material.dart';
import 'package:weather/home.dart';
import 'package:weather/countries.dart';
import 'package:weather/home.dart';
import 'package:weather/new.dart';
import 'package:weather/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/new': (context) => Load(),
        '/home': (context) => Home(),
        '/choose': (context) => Country()
      },
    );

    // is not restarted.

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
