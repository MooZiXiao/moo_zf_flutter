import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/model/general_type.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/filter_bar/data.dart';
import 'package:moo_zf_flutter/pages/home/tab_search/filter_bar/item.dart';
import 'package:moo_zf_flutter/scoped_model/room_filter.dart';
import 'package:moo_zf_flutter/utils/common_picker/index.dart';
import 'package:moo_zf_flutter/utils/scopoed_model_helper.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  const FilterBar({Key key, this.onChange}) : super(key: key);
   
  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];
  
  _onAreaChange (context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      value: 0,
      options: areaList.map((item) => item.name).toList()
    );

    result.then((index) {
      if(index == null) return null;
      setState(() {
        areaId = areaList[index].id;
      });
      _onChange(context);
    }).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
  }
  _onRentTypeChange (context) {
    setState(() {
      isRentTypeActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      value: 0,
      options: rentTypeList.map((item) => item.name).toList()
    );

    result.then((index) {
      if(index == null) return null;
      setState(() {
        rentTypeId = rentTypeList[index].id;
      });
      _onChange(context);
    }).whenComplete(() {
      setState(() {
        isRentTypeActive = false;
      });
    });
  }
  _onPriceChange (context) {
    setState(() {
      isPriceActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      value: 0,
      options: priceList.map((item) => item.name).toList()
    );

    result.then((index) {
      if(index == null) return null;
      setState(() {
        priceId = priceList[index].id;
      });
      _onChange(context);
    }).whenComplete(() {
      setState(() {
        isPriceActive = false;
      });
    });
  }
  _onFilterChange (context) {
    Scaffold.of(context).openEndDrawer();
  }
  _onChange (context) {
    var selectedList = ScopedModelHelper.getModel<FilterBarModal>(context).selectedList;

    if(widget.onChange != null) {
      widget.onChange(FilterBarResult(
        areaId: areaId,
        rentTypeId: rentTypeId,
        priceId: priceId,
        moreIds: selectedList.toList()
      ));
    }
  }

  _getData() {
    Map<String, List<GeneralType>> dataList = Map<String, List<GeneralType>> ();
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;
    ScopedModelHelper.getModel<FilterBarModal>(context).dataList = dataList;
  }

  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Colors.black12
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Item(title:'区域', isActive: isAreaActive, onTap: _onAreaChange,),
          Item(title:'方式', isActive: isRentTypeActive, onTap: _onRentTypeChange,),
          Item(title:'租金', isActive: isPriceActive, onTap: _onPriceChange,),
          Item(title:'筛选', isActive: isFilterActive, onTap: _onFilterChange,)
        ],
      ),
    );
  }
}