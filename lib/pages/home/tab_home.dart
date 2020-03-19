import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/info/index.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/navigator/index_navigator.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/recommend/index_recommend.dart';
import 'package:moo_zf_flutter/widget/common_swiper.dart';
import 'package:moo_zf_flutter/widget/search_bar/index.dart';

class TabHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          // 搜索
          SearchBarWidget(
            showLoaction: true, 
            showMap: true,
            onSearch: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        backgroundColor: Colors.white,
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