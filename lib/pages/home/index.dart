import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            child: Text('/login'),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          FlatButton(
            child: Text('不存在'),
            onPressed: () {
              Navigator.pushNamed(context, '/aaaa');
            },
          ),
        ],
      )
    );
  }
}