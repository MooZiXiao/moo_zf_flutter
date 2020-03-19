import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/recommend/index_recommend_item.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/recommend/index_recommend_item_widget.dart';

class IndexRecommend extends StatelessWidget {

  List<IndexRecommendItem> dataList = [];
  IndexRecommend({this.dataList = IndexRecommendList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0x08000000)
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '房屋推荐',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
              Text(
                '更多',
                style: TextStyle(
                  color: Colors.black54
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(5.0),),
          Wrap(
            runSpacing: 10.0,
            spacing: 10.0,
            children: dataList.map((item) => 
              IndexRecommendItemWidget(item)
            ).toList(),
          )
        ],
      ),
    );
  }
}