import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/filter_bar/data.dart';
import 'package:moo_zf_flutter/scoped_model/room_filter.dart';
import 'package:moo_zf_flutter/utils/scopoed_model_helper.dart';
import 'package:moo_zf_flutter/widget/common_title.dart';

class FilterDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModal>(context).dataList;

    roomTypeList = dataList['roomTypeList'];
    orientedList = dataList['orientedList'];
    floorList = dataList['floorList'];  
    var selectedIds = ScopedModelHelper.getModel<FilterBarModal>(context).selectedList.toList();

    _onChange (String val) {
      ScopedModelHelper.getModel<FilterBarModal>(context).selectedListToggleitem(val);
    }
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            CommonTitle('户型'),
            FilterDrawerItem(
              list: roomTypeList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            CommonTitle('朝向'),
            FilterDrawerItem(
              list: orientedList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            CommonTitle('楼层'),
            FilterDrawerItem(
              list: floorList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;

  const FilterDrawerItem({Key key, this.list, this.selectedIds, this.onChange}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0 ),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list.map((item) {
          var isActive = selectedIds.contains(item.id);
          return GestureDetector(
            onTap: () {
              if(onChange != null) onChange(item.id);
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.white,
                border: Border.all(
                  width:1.0,
                  color: Colors.green
                )
              ),
              child: Center(
                child: Text(
                  item.name,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.green
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}