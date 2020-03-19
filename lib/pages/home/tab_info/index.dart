import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/info/index.dart';

class TabInfo extends StatefulWidget {
  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资讯'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 10.0),),
          InfoIndex(),
          InfoIndex(),
          InfoIndex()
        ],
      ),
    );
  }
}