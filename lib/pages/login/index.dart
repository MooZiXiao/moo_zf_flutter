import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/scoped_model/auth.dart';
import 'package:moo_zf_flutter/utils/common_toast.dart';
import 'package:moo_zf_flutter/utils/dio_http.dart';
import 'package:moo_zf_flutter/utils/request_url.dart';
import 'package:moo_zf_flutter/utils/scopoed_model_helper.dart';
import 'package:moo_zf_flutter/utils/store.dart';
import 'package:moo_zf_flutter/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPwd = false;

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  _loginHandle () async {
    var username = usernameController.text;
    var password = passwordController.text;

    // 为空
    if(stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      CommonToast.ShowToast('用户名或密码不为空');
      return;
    }
    
    const url = UserUri.Login;
    var params = {
      "username": username,
      "password": password
    };

    var res = await DioHttp.of(context).post(url, params);
    var resString = json.decode(res.toString());

    int status = resString['status'];
    String description = resString['description'] ?? '内部错误';

    CommonToast.ShowToast(description);

    if(status.toString().startsWith('2')) {
      String token = resString['body']['token'];

      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);
      // 全局共享
      ScopedModelHelper.getModel<AuthModel>(context).login(token, context);

      Timer(Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            TextField(
                controller: usernameController,
                decoration:
                    new InputDecoration(hintText: '请输入用户名', labelText: '用户名')
            ),
            TextField(
              controller: passwordController,
              obscureText: !showPwd,
              decoration: new InputDecoration(
                  hintText: '请输入密码',
                  labelText: '密码',
                  suffixIcon: IconButton(
                    icon:
                        Icon(showPwd ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        showPwd = !showPwd;
                      });
                    },
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                '登陆',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _loginHandle();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('还没有帐号，'),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                  child: Text(
                    '去注册~',
                    style: TextStyle(color: Colors.green),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
