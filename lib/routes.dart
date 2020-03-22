import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:moo_zf_flutter/pages/home/index.dart';
import 'package:moo_zf_flutter/pages/login/index.dart';
import 'package:moo_zf_flutter/pages/notFound.dart';
import 'package:moo_zf_flutter/pages/register/index.dart';
import 'package:moo_zf_flutter/pages/romm_add/index.dart';
import 'package:moo_zf_flutter/pages/room_detail/index.dart';
import 'package:moo_zf_flutter/pages/room_manage/index.dart';
import 'package:moo_zf_flutter/pages/setting.dart';

class Routes {
  // 定义路由名称
  static String home = '/';
  static String login = '/login';
  static String register = '/register';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';
  static String roomDetail = '/roomDetail/:roomId';
  
  // 定义路由处理函数
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomePage();
  });
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  });
  static Handler _registerHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RegisterPage();
  });
  static Handler _settingHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SettingPage();
  });
  static Handler _roomManageHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomManagePage();
  });
  static Handler _roomAddHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomAddPage();
  });
  static Handler _roomDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RoomDetailPage(
      roomId: params['roomId'][0],
    );
  });
  static Handler _notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return NotFoundPage();
  });

  // 编写函数 defineRoutes 关联路由名称和处理函数
  static void configureRoutes(Router router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}