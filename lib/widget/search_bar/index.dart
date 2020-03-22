import 'dart:convert';

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/config.dart';
import 'package:moo_zf_flutter/model/general_type.dart';
import 'package:moo_zf_flutter/scoped_model/city.dart';
import 'package:moo_zf_flutter/utils/common_toast.dart';
import 'package:moo_zf_flutter/utils/scopoed_model_helper.dart';
import 'package:moo_zf_flutter/utils/store.dart';
import 'package:moo_zf_flutter/widget/common_image.dart';

class SearchBarWidget extends StatefulWidget {
  final bool showLoaction;//展示位置按钮
  final Function goBackCallback;//回退按钮函数
  final String inputValue;// 搜索框输入值
  final String defaultInputValue;// 搜索框默认值
  final Function onCancel;//取消按钮
  final bool showMap;//展示地图按钮
  final Function onSearch; //用户点击搜索框触发
  final ValueChanged<String> onSearchSubmit;// 用户输入搜索词后，点击键盘的搜索键触发

  SearchBarWidget({this.showLoaction, this.goBackCallback, this.inputValue = '', this.defaultInputValue = '请输入搜索词', this.onCancel, this.showMap, this.onSearch, this.onSearchSubmit});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _controller;
  FocusNode _focus;
  String _searchWord = '';
  Function _onClear () {
    setState(() {
      _controller.clear();
      _searchWord = '';
    });
  }

  _saveCity(GeneralType city) async {
    if(city == null) return;
    ScopedModelHelper.getModel<CityModel>(context).city = city;
    var store = await Store.getInstance();
    var cityString = json.encode(city.toJson());
    store.setString(StoreKeys.city, cityString);
  }

  _changeLocation() async {
    var result = await CityPickers.showCitiesSelector(context: context, theme: ThemeData(primaryColor: Colors.green));

    String cityName = result?.cityName;
    if(null == cityName) return;

    var city = Config.availableCitys.firstWhere((city) =>cityName.startsWith(city.name), orElse: () {
      CommonToast.ShowToast('该城市暂未开通！');
      return null;
    });

    if(city == null) return;

    _saveCity(city);
  }

  _getCity() async {
    var store = await Store.getInstance();
    var cityString = await store.getString(StoreKeys.city);
    if(null == cityString) return;
    var city = GeneralType.formJson(json.decode(cityString));
    ScopedModelHelper.getModel<CityModel>(context).city = city;
  }

  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
  }

  @override
  Widget build(BuildContext context) {
    var city = ScopedModelHelper.getModel<CityModel>(context).city;
    if(null == city) {
      city = Config.availableCitys.first;
      _getCity();
    }
    return Container(
      child: Row(
        children: <Widget>[
          widget.showLoaction != null ? Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                _changeLocation();
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.room, color: Colors.green, size: 16.0,),
                  Text(
                    city.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0
                    ),
                  )
                ],
              ),
            ),
          ) : SizedBox(),

          widget.goBackCallback != null ? Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: widget.goBackCallback,
              child: Icon(Icons.chevron_left, color: Colors.black,),
            ),
          ) : SizedBox(),

          Expanded(
            child: Container(
              height: 34.0,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(17.0)
              ),
              child: TextField(
                focusNode: _focus,
                controller: _controller,
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                  hintText: widget.defaultInputValue,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                  contentPadding: EdgeInsets.only(bottom: 2.0, left: -8.0),
                  border: InputBorder.none,
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 8.0),
                    child: Icon(Icons.search, size: 18.0, color: Colors.grey,),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onClear();
                    },
                    child: Icon(Icons.clear, size: 18.0, color: _searchWord == '' ? Colors.grey[200] : Colors.grey,)
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    _searchWord = value;
                  });
                },
                onTap: () {
                  if(null == widget.onSearchSubmit) {
                    _focus.unfocus();
                  }
                  _focus.unfocus();
                  widget.onSearch();
                },
                onSubmitted: widget.onSearchSubmit,
                textInputAction: TextInputAction.search,
              ),
            ),
          ),

          widget.onCancel != null ? Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: widget.onCancel,
              child: Text(
                '取消',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black
                ),
              ),
            ),
          ) : SizedBox(),

          widget.showMap != null ? CommonImage('static/icons/widget_search_bar_map.png') : SizedBox()

        ],
      ),
    );
  }
}