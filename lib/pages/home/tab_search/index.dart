import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/data.dart';
import 'package:moo_zf_flutter/widget/common_list_item.dart';
import 'package:moo_zf_flutter/widget/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          // 搜索
          SearchBarWidget(
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
            child: Text('filterBar'),
          ),
          Expanded(
            child: ListView(
              children: dataList.map((item) => CommonListItemWidget(item)
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