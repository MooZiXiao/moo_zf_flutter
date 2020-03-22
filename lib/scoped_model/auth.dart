import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/model/user_info.dart';
import 'package:moo_zf_flutter/utils/dio_http.dart';
import 'package:moo_zf_flutter/utils/request_url.dart';
import 'package:moo_zf_flutter/utils/store.dart';
import 'package:moo_zf_flutter/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  String _token = '';
  UserInfo _userInfo;
  String get token => _token;

  bool get isLogin => _token is String && _token != '';
  UserInfo get userInfo => _userInfo;

  void initApp (BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);

    if(!stringIsNullOrEmpty(token)) {
      login(token, context);
    }
  }

  _getUserInfo(BuildContext context) async {
    const url = UserUri.GetUserInfo;
    var res = await DioHttp.of(context).get(url, null, _token);
    var resMap = json.decode(res.toString());

    var data  = resMap['body'];
    var userInfo = UserInfo.fromJson(data);

    _userInfo = userInfo;
    notifyListeners();

  }

  void login (String token, BuildContext context) {
    _token = token;
    notifyListeners();
    _getUserInfo(context);
  }

  void logout () {
    _token = '';
    _userInfo = null;
    notifyListeners();
  }
}