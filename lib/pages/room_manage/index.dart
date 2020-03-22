import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/model/room_list_item_data.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/data.dart';
import 'package:moo_zf_flutter/scoped_model/auth.dart';
import 'package:moo_zf_flutter/utils/dio_http.dart';
import 'package:moo_zf_flutter/utils/scopoed_model_helper.dart';
import 'package:moo_zf_flutter/widget/common_floating_action_button.dart';
import 'package:moo_zf_flutter/widget/common_list_item.dart';

class RoomManagePage extends StatefulWidget {
  @override
  _RoomManagePageState createState() => _RoomManagePageState();
}

class _RoomManagePageState extends State<RoomManagePage> {
  List<RoomListItemData> availableDataList = [];
  _getData() async {
    var auth = ScopedModelHelper.getModel<AuthModel>(context);
    if (!auth.isLogin) return;
    var token = auth.token;
    String url = '/user/houses';
    var res = await DioHttp.of(context).get(url, null, token);
    var resMap = json.decode(res.toString());
    List listMap = resMap['body'];

    var dataList =
        listMap.map((json) => RoomListItemData.fromJson(json)).toList();

    setState(() {
      availableDataList = dataList;
    });
  }
  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('房屋管理'),
          centerTitle: true,
          elevation: 0.0,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: '空置'
              ),
              Tab(
                text: '已租'
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton('发布房源', () {
          Navigator.pushNamed(context, '/roomAdd');
        }),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: availableDataList.map((item) => CommonListItemWidget(item)).toList()
            ),
            ListView(
              children: dataList.map((item) => CommonListItemWidget(item)).toList()
            ),
          ],
        ),
      ),
    );
  }
}