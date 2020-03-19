import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/info/index.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/navigator/index_navigator.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/recommend/index_recommend.dart';
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
          // 推荐
          IndexRecommend(),
          // 资讯
          InfoIndex(showTitle: true,),
        ],
      ),
    );
  }
}