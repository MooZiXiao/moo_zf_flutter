import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/widget/common_image.dart';

class Advertisement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: CommonImage('https://tva1.sinaimg.cn/large/006y8mN6ly1g6te62n8f4j30j603vgou.jpg'),
    );
  }
}