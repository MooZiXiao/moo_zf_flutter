import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/pages/login/index.dart';
import 'package:moo_zf_flutter/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Router router = Router();
    Routes.configureRoutes(router);
    return MaterialApp(
      title: 'Moo zf',
      home: LoginPage(),
      onGenerateRoute: router.generator,
    );
  }
}