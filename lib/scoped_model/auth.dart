import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/utils/store.dart';
import 'package:moo_zf_flutter/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  String _token = '';
  String get token => _token;

  bool get isLogin => _token is String && _token != '';

  void initApp (BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);

    if(!stringIsNullOrEmpty(token)) {
      login(token, context);
    }
  }

  void login (String token, BuildContext context) {
    _token = token;
    notifyListeners();
  }

  void logout () {
    _token = '';
    notifyListeners();
  }
}