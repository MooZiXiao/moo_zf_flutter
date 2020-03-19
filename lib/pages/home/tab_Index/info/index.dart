import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/info/data.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/info/item_widget.dart';

class InfoIndex extends StatelessWidget {
  final bool showTitle;
  final List<InfoItem> dataList;
  InfoIndex({this.showTitle = false, this.dataList = infoData});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          showTitle ? Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
            child: Text(
              '最新资讯',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600
              ),
            ),
          ) : SizedBox(), 
          Column(
            children: dataList.map((item) => 
              ItemWidget(item)
              // Container(
              //   height: 100.0,
              //   margin: EdgeInsets.only(bottom: 10.0),
              //   decoration: BoxDecoration(
              //     // color: Colors.red
              //   ),
              // )
            ).toList(),
          )
        ],
      ),
    );
  }
}