import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_Index/recommend/index_recommend_item.dart';
import 'package:moo_zf_flutter/widget/common_image.dart';

var textStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w600
);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;
  IndexRecommendItemWidget(this.data);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, data.navigatorUri);
        },
        child: Container(
          width: (MediaQuery.of(context).size.width - 10.0 * 3) / 2,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    data.title,
                    style: textStyle,
                  ),
                  Text(
                    data.subTitle,
                    style: textStyle,
                  )
                ],
              ),
              CommonImage(data.imageUri, width: 55.0)
            ],
          ),
      ),
    );
  }
}