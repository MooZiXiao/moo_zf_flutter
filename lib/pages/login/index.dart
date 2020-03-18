import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPwd = false;
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
                decoration:
                    new InputDecoration(hintText: '请输入用户名', labelText: '用户名')
            ),
            TextField(
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
              onPressed: () {},
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
