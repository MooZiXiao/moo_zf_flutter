import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/widget/common_floating_action_button.dart';
import 'package:moo_zf_flutter/widget/common_form_item.dart';
import 'package:moo_zf_flutter/widget/common_radio_form_item.dart';
import 'package:moo_zf_flutter/widget/common_title.dart';

class RoomAddPage extends StatefulWidget {
  @override
  _RoomAddPageState createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0;
  int decorationType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('房源发布'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          // title
          CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区  ',
            contentBuilder: (context){
              return Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  child: Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '请选择小区',
                          style: TextStyle(
                            fontSize: 16.0
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              );
            }
          ),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonRadioFormItem(
            label: '租赁方式',
            options: ['合租', '整租'],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index;
              });
            }
          ),
          CommonRadioFormItem(
            label: '装修',
            options: ['精装', '简装'],
            value: decorationType,
            onChange: (index) { 
              setState(() {
                decorationType = index;
              });
            }
          ),
          CommonTitle('房源头像'),
          CommonTitle('房源标题'),
          CommonTitle('房源配置'),
          CommonTitle('房源描述'),
          // 

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('发布', () {
        
      }),
    );
  }
}