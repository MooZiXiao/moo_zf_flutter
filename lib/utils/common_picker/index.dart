import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommonPicker {
  static Future<int> showPicker({
    BuildContext context,
    List<String> options,
    int value,
    double height = 300.0,
  }) {
    return showCupertinoModalPopup<int>(
      context: context, 
      builder: (BuildContext context) {
        var btnStyle = TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600
        );
        var controller = FixedExtentScrollController(initialItem: value);
        return Container(
          height: height,
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.grey[200],
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '取消',
                        style: btnStyle,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(controller.selectedItem);
                      },
                      child: Text(
                        '确定',
                        style: btnStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController: controller,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemExtent: 35.0,
                  onSelectedItemChanged: (val) {

                  },
                  children: options.map((item) => Text(
                    item
                  )).toList(),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
