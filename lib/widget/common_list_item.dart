import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/config.dart';
import 'package:moo_zf_flutter/model/room_list_item_data.dart';
import 'package:moo_zf_flutter/widget/common_image.dart';
import 'package:moo_zf_flutter/widget/common_tag.dart';

class CommonListItemWidget extends StatelessWidget {
  final RoomListItemData data;
  CommonListItemWidget(this.data);
  @override
  Widget build(BuildContext context) {
    var imageUrl = data.imageUri.startsWith('http') ? data.imageUri : Config.BaseUrl + data.imageUri;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/roomDetail/:${data.id}');
      },
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: Row(
          children: <Widget>[
            CommonImage(imageUrl, width: 132.5, height: 100.0,),
            Padding(padding: EdgeInsets.only(left: 10.0),),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    data.subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Wrap(
                    children: data.tags.map((item) => CommonTag(item)).toList(),
                  ),
                  Text(
                    '${data.price} 元/月',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}