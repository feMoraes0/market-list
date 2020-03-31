import 'package:flutter/material.dart';
import 'package:marketlist/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Market App',
      theme: ThemeData(),
      home: Home(),
    );
  }
}
