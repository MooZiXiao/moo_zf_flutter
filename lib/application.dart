import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/routes.dart';
import 'package:moo_zf_flutter/scoped_model/auth.dart';
import 'package:moo_zf_flutter/scoped_model/city.dart';
import 'package:moo_zf_flutter/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Router router = Router();
    Routes.configureRoutes(router);
    return ScopedModel<AuthModel> (
      model: AuthModel(),
      child:ScopedModel<CityModel> (
        model: CityModel(),
        child: ScopedModel<FilterBarModal>(
          model: FilterBarModal(),
          child:  MaterialApp(
            theme: ThemeData(primaryColor: Colors.green),
            onGenerateRoute: router.generator,
          )
        )
      )
    );
  }
}