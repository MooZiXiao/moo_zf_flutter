import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/widget/common_floating_action_button.dart';
import 'package:moo_zf_flutter/widget/common_form_item.dart';
import 'package:moo_zf_flutter/widget/common_image_picker.dart';
import 'package:moo_zf_flutter/widget/common_radio_form_item.dart';
import 'package:moo_zf_flutter/widget/common_select_form_item.dart';
import 'package:moo_zf_flutter/widget/common_title.dart';
import 'package:moo_zf_flutter/widget/room_appliance.dart';

class RoomAddPage extends StatefulWidget {
  @override
  _RoomAddPageState createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0;
  int decorationType = 0;
  int roomType = 0;
  int floor = 0;
  int oriented = 0;
  var titleController = TextEditingController();
  var descController = TextEditingController();

  
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
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
            options: ['一室','二室','三室','四室',],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
            options: ['高楼层','中楼层','低楼层',],
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: oriented,
            onChange: (val) {
              setState(() {
                oriented = val;
              });
            },
            options: ['东','南','西','北京',],
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
          CommonTitle('房源图像'),
          CommonImagePicker(
            onChange: (List<File> files) {},
          ),
          CommonTitle('房源标题'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: '请输入标题（例如：整组，小区名 2室 2000元）',
                border: InputBorder.none
              ),
            )
          ),
          CommonTitle('房源配置'),
          RoomAppliance(
            onChange: (data) {
              
            },
          ),
          CommonTitle('房源描述'),
          Container(
            margin: EdgeInsets.only(bottom: 100.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: descController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: '请输入房屋描述信息',
                border: InputBorder.none
              ),
            )
          ),
          // 

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton('发布', () {
        
      }),
    );
  }
}