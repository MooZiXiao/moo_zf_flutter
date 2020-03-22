import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/model/room_list_item_data.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/data.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/filter_bar/data.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/filter_bar/index.dart';
import 'package:moo_zf_flutter/utils/dio_http.dart';
import 'package:moo_zf_flutter/utils/scopoed_model_helper.dart';
import 'package:moo_zf_flutter/widget/common_list_item.dart';
import 'package:moo_zf_flutter/widget/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  List<RoomListItemData> list = [];
  _onFilterBarChange(FilterBarResult data) async {
    var cityId = Uri.encodeQueryComponent(ScopedModelHelper.getAreaId(context));
    var area = Uri.encodeQueryComponent(data.areaId);
    var mode = Uri.encodeQueryComponent(data.rentTypeId);
    var price = Uri.encodeQueryComponent(data.priceId);
    var more = Uri.encodeQueryComponent(data.moreIds.join(','));
    String url = '/houses?cityId=' +
        '$cityId&area=$area&mode=$mode&price=$price&more=$more&start=1&end=20';
    var res = await DioHttp.of(context).get(url);
    var resMap = json.decode(res.toString());
    List dataMap = resMap['body']['list'];

    List<RoomListItemData> resList =
        dataMap.map((json) => RoomListItemData.fromJson(json)).toList();

    if (!mounted) return;

    setState(() {
      list = resList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
        actions: <Widget>[Container()],
        title: 
          // 搜索
          SearchBarWidget(
            showLoaction: true,
            showMap: true,
            onSearch: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            child: FilterBar(onChange: _onFilterBarChange,),
          ),
          Expanded(
            child: ListView(
              children: list.map((item) => CommonListItemWidget(item)
                // Container(
                //   height: 100.0,
                //   margin: EdgeInsets.only(bottom: 10.0),
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //   ),
                // )
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}