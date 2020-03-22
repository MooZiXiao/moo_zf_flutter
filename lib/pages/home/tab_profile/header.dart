import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/config.dart';
import 'package:moo_zf_flutter/scoped_model/auth.dart';
import 'package:moo_zf_flutter/utils/scopoed_model_helper.dart';

var loginAndRegisterStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0 
);

class ProfileHeader extends StatelessWidget {

  Widget _noLoginBuilder (BuildContext context) {
    return Container(
      height: 95.0,
      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 65.0,
            height: 65.0,
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 6.0),),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      '登录',
                      style: loginAndRegisterStyle
                    ),
                  ),
                  Text(
                    '/',
                    style: loginAndRegisterStyle
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      '注册',
                      style: loginAndRegisterStyle
                    ),
                  )
                ],
              ),
              Text(
                '登录后可以体验更多',
                style: TextStyle(
                  color: Colors.white
                )
              )
            ],
          )
        ],
      ),
    );
  }
  
  Widget _loginBuilder (BuildContext context) {
    var userInfo = ScopedModelHelper.getModel<AuthModel>(context).userInfo;
    String userName = userInfo?.nickname ?? '已登陆用户名';
    String userImage = userInfo?.avatar ?? 'https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg';
    if(!userImage.startsWith('http')) {
      userImage = Config.BaseUrl + userImage;
    }
    return Container(
      height: 95.0,
      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 65.0,
            height: 65.0,
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 6.0),),
              Text(
                userName,
                style: loginAndRegisterStyle,
              ),
              GestureDetector(
                onTap: () {

                },
                child: Text(
                  '查看编辑个人资料',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    
    return isLogin ? _loginBuilder(context) : _noLoginBuilder(context);
  }
}