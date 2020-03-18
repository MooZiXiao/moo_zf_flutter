import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:moo_zf_flutter/pages/home/index.dart';
import 'package:moo_zf_flutter/pages/login/index.dart';
import 'package:moo_zf_flutter/pages/notFound.dart';

class Routes {
  // 定义路由名称
  static String home = '/';
  static String login = '/login';
  // 定义路由处理函数
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomePage();
  });
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  });
  static Handler _notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return NotFoundPage();
  });

  // 编写函数 defineRoutes 关联路由名称和处理函数
  static void configureRoutes(Router router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}