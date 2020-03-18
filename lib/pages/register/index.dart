import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPwd = true;
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
              decoration: new InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名'
              ),
            ),
            TextField(
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
              obscureText: !showPwd,
              decoration: new InputDecoration(
                labelText: '确认密码',
                hintText: '请输入确认密码',
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