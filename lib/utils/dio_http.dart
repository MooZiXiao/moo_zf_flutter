import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moo_zf_flutter/config.dart';

class DioHttp {
  Dio _client;
  BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal (BuildContext context) {
    if(_client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
        baseUrl: Config.BaseUrl,
        connectTimeout: 1000 * 10,
        receiveTimeout: 1000 * 3,
        extra: {'context': context}
      );

      var client = Dio(options);
      this._client = client;


    }
  }
  // get
  Future<Response<Map<String, dynamic>>> get(String path, [Map<String, dynamic> params, String token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.get(
      path,
      queryParameters: params,
      options: options
    );
  }
  // post
  Future<Response<Map<String, dynamic>>> post(String path, [Map<String, dynamic> params, String token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.post(
      path,
      data: params,
      options: options
    );
  }
  // postData
  Future<Response<Map<String, dynamic>>> postFormData(String path, [Map<String, dynamic> params, String token]) async {
    var options = Options(
      contentType: ContentType.parse('multipart/form-data').toString(),
      headers: {'Authorization': token},
    );
    return await _client.post(
      path,
      data: params,
      options: options
    );
  }
}