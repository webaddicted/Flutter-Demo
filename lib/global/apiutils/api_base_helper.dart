import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';

class ApiBaseHelper {
  Dio _dio;

  ApiBaseHelper() {
    BaseOptions options = BaseOptions(
        receiveTimeout: ApiConstant.TIME_OUT,
        connectTimeout: ApiConstant.TIME_OUT);
    options.baseUrl = ApiConstant.BASE_URL;
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor());
  }

  Future<Response<dynamic>> get(String url) async {
    Response response =
    await _dio.get(url, options: Options(responseType: ResponseType.json));
    return response;
  }

  Future<Response<dynamic>> getWithParam(
      @required String url, @required Map<String, String> params) async {
    Response response;
    try {
        response = await _dio.get(url,
            queryParameters: params,
            options: Options(responseType: ResponseType.json));
    } on Exception{
      response = new Response();
      response.statusCode = ApiRespoCode.known;
      response.statusMessage = ApiConstant.known;
    }
    // print('respo : '+response.toString());
    return response;
  }

  Future<Response> post(String url, Map<String, String> params) async {
    Response response = await _dio.post(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  Future<Response> put(String url, Map<String, String> params) async {
    Response response = await _dio.put(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  Future<Response> delete(String url, Map<String, String> params) async {
    Response response = await _dio.delete(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }
}

class ApiRespoCode {
  static int success = 200;
  static int no_internet_connection = 999;
  static int known = 533;

}

///Single final Object of ApiBaseHelper
final apiHelper = ApiBaseHelper();
