import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/index_nav_item.dart';
import 'package:moo_zf_flutter/widget/common_image.dart';

class IndexNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
          IndexNavigatorItemList.map((item) => 
            InkWell(
              onTap: () {
                item.onTap(context);
              },
              child: Column(
                children: <Widget>[
                  CommonImage(item.uri, width: 47.5,),
                  Text(item.title, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),)
                ],
              ),
            )
          ).toList(),
      ),
    );
  }
}