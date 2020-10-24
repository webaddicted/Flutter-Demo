import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';

class ApiBaseHelper {
  Dio _dio;

  ApiBaseHelper() {
    BaseOptions options = BaseOptions(
        receiveTimeout: ApiConst.TIME_OUT,
        connectTimeout: ApiConst.TIME_OUT);
    options.baseUrl = ApiConst.BASE_URL;
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor());
  }

  Future<Response<dynamic>> get(String url) async {
    Response response =
        await _dio.get(url, options: Options(responseType: ResponseType.json));
    return response;
  }

  Future<Response<dynamic>> getWithParam(
      String url, Map<String, String> params) async {
    Response response;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await _dio.get(url,
            queryParameters: params,
            options: Options(responseType: ResponseType.json));
      }
    } on SocketException catch (_) {
      print('not connected');
      response = new Response();
      response.statusCode = ApiRespoCode.no_internet_connection;
      response.statusMessage = ApiConst.NoInternetConnection;
    }
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
