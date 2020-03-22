import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/config.dart';
import 'package:moo_zf_flutter/scoped_model/city.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelHelper {
  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }
  static String getAreaId(context){
    return ScopedModelHelper.getModel<CityModel>(context).city?.id ?? Config.availableCitys.first.id;
  }
}