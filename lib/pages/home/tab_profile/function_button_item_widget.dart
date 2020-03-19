import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_profile/function_button_item_data.dart';
import 'package:moo_zf_flutter/widget/common_image.dart';

class FunctionButtonItemWidget extends StatelessWidget {
  final FunctionButtonItem data;
  FunctionButtonItemWidget(this.data);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(null != data.onTapHandle) {
          data.onTapHandle(context);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 25.0),
        width: MediaQuery.of(context).size.width * 0.33,
        child: Column(
          children: <Widget>[
            CommonImage(data.imageUri), 
            Text(data.title)
          ],
        ),
      ),
    );
  }
}
