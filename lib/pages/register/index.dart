import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/utils/common_toast.dart';
import 'package:moo_zf_flutter/utils/dio_http.dart';
import 'package:moo_zf_flutter/utils/request_url.dart';
import 'package:moo_zf_flutter/utils/string_is_null_or_empty.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPwd = false;
  bool showRePwd = false;
  var usernameController = TextEditingController();
  var pwdController = TextEditingController();
  var rePwdController = TextEditingController();

  _registerHandler () async {
    var username = usernameController.text;
    var password = pwdController.text;
    var repeatPassword = rePwdController.text;

    if(stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      CommonToast.ShowToast('用户名或密码不为空');
      return;
    }

    if(password != repeatPassword) {
      CommonToast.ShowToast('两次密码输入不一致');
      return;
    }
    // 调用接口前的准备
    var url = UserUri.Register;
    var params = {
      "username": username,
      "password": password
    };
    // 调用接口
    var res = await DioHttp.of(context).post(url, params);
    // 解码
    var resString = json.decode(res.toString());
    // print(res);
    // print('=============');
    // print(resString);
    int status = resString['status'];
    String description = resString['description'] ?? '内部错误';
    CommonToast.ShowToast(description);
    if(status.toString().startsWith('2')) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: new InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名'
              ),
            ),
            TextField(
              controller: pwdController,
              obscureText: !showPwd,
              decoration: new InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                suffixIcon: IconButton(
                  icon: Icon(showPwd ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      showPwd = !showPwd;
                    });
                  },
                )
              ),
            ),
            TextField(
              controller: rePwdController,
              obscureText: !showRePwd,
              decoration: new InputDecoration(
                labelText: '确认密码',
                hintText: '请输入确认密码',
                suffixIcon: IconButton(
                  icon: Icon(showRePwd ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      showRePwd = !showRePwd;
                    });
                  },
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            FlatButton(
              color: Colors.green,
              child: Text(
                '注册',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: () {
                _registerHandler();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '已有帐号,'
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text(
                    '去登陆~',
                    style: TextStyle(
                      color: Colors.green
                    ),
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