import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moo zf',
      home: HomePage(),
    );
  }
}