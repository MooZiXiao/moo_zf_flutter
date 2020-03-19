import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/index_nav.dart';
import 'package:moo_zf_flutter/pages/home/index_navigator.dart';
import 'package:moo_zf_flutter/widget/common_swiper.dart';

class TabHomePage extends StatelessWidget {
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
          // 轮播图
          CommonSwiper(),
          // nav
          IndexNavigator(),
          
        ],
      ),
    );
  }
}