import 'package:flutter/material.dart';

import 'Views/beach.dart';
import 'Views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Challenges',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: {
        '/beach': (context) => Beach(),
      },
    );
  }
}