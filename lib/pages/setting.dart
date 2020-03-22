import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/scoped_model/auth.dart';
import 'package:moo_zf_flutter/utils/common_toast.dart';
import 'package:moo_zf_flutter/utils/scopoed_model_helper.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              ScopedModelHelper.getModel<AuthModel>(context).logout();
              CommonToast.ShowToast('已经退出登陆');
            },
            child: Text(
              '退出登陆',
              style: TextStyle(
                color: Colors.red
              ),
            ),
          )
        ],
      ),
    );
  }
}