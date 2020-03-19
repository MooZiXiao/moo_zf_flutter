import 'package:flutter/material.dart';

class IndexNavigatorItem {
  final String title;
  final String uri;
  final Function(BuildContext context) onTap;

  IndexNavigatorItem(this.title, this.uri, this.onTap);
}

List<IndexNavigatorItem> IndexNavigatorItemList = [
  IndexNavigatorItem('整租', 'static/images/home_index_navigator_total.png',
      (BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }),
  IndexNavigatorItem('合租', 'static/images/home_index_navigator_share.png',
      (BuildContext context) {
    Navigator.of(context).pushReplacementNamed('login');
  }),
  IndexNavigatorItem('地图找房', 'static/images/home_index_navigator_map.png',
      (BuildContext context) {
    Navigator.of(context).pushReplacementNamed('login');
  }),
  IndexNavigatorItem('去出租', 'static/images/home_index_navigator_rent.png',
      (BuildContext context) {
    Navigator.pushNamed(context, 'login');
  }),
];
