import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/data.dart';
import 'package:moo_zf_flutter/widget/common_floating_action_button.dart';
import 'package:moo_zf_flutter/widget/common_list_item.dart';

class RoomManagePage extends StatelessWidget {
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
        floatingActionButton: CommonFloatingActionButton('发布房源', () {Navigator.pushNamed(context, '/roomAdd');}),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: dataList.map((item) => CommonListItemWidget(item)).toList()
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