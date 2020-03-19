import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/index_nav_item.dart';

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
                  Image.asset(item.uri, width: 47.5,),
                  Text(item.title)
                ],
              ),
            )
          ).toList(),
      ),
    );
  }
}