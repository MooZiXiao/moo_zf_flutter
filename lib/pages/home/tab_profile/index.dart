import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/info/index.dart';
import 'package:moo_zf_flutter/pages/home/tab_profile/advertisement.dart';
import 'package:moo_zf_flutter/pages/home/tab_profile/function_button.dart';
import 'package:moo_zf_flutter/pages/home/tab_profile/header.dart';

class TabProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          // header
          ProfileHeader(),
          // 
          FunctionButton(),
          // 广告
          Advertisement(),
          // 资讯
          InfoIndex(showTitle: true,),
          InfoIndex(),
        ],
      )
    );
  }
}