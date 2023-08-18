import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';

class ApiBaseHelper {
  Dio? _dio;

  // Alice? alice;

  ApiBaseHelper() {
    // alice = Alice(showNotification: true);
    var options = BaseOptions(
        receiveTimeout: const Duration(seconds: ApiConstant.TIME_OUT),
        connectTimeout: const Duration(seconds: ApiConstant.TIME_OUT));
    options.baseUrl = ApiConstant.BASE_URL;

    var map = <String, dynamic>{};
    // map['Authorization'] = 'Client-ID ${ApiConstant.UnsplashApiKey}';

    _dio = Dio(options);
    _dio!.options.headers = map;
    // _dio.options.headers['content-Type'] = 'application/json';
    // _dio.options.headers["authorization"] = "token ${token}";
    _dio!.interceptors.add(LogInterceptor());
    // _dio!.interceptors.add(alice!.getDioInterceptor()); //displays logs in notification view
  }

  /// Method : GET
  /// Params : url
  Future<Response<dynamic>> getWithoutParams(String url) async {
    var response =
    await _dio?.get(url, options: Options(responseType: ResponseType.json));
    return response!;
  }

  /// Method : GET
  /// Params : url, map for parameters
  Future<Response<dynamic>> getWithParam(
      {String url = '', Map<String, dynamic>? params}) async {
    Response response;
    try {
      response = (await _dio?.get(url,
          queryParameters: params,
          options: Options(responseType: ResponseType.json)))!;
    } on SocketException catch (e) {
      printLog(msg: "SocketException $e");
      response = Response(requestOptions: RequestOptions(path: 'path'));
      response.statusCode = ApiResponseCode.internetUnavailable;
      response.statusMessage = StringConst.noInternetConnection;
    } on Exception catch (e) {
      printLog(msg: 'object Exception');
      response = Response(requestOptions: RequestOptions(path: 'path'));
      response.statusCode = ApiResponseCode.unknown;
      response.statusMessage =
      "$e ${StringConst.somethingWentWrong}";
      // response.data = e;
    }
    printLog(msg: 'response : $response');
    return response;
  }

  /// Method : POST
  /// Params : url, map for parameters
  Future<Response> post({String url = '', params}) async {
    var response = await _dio!.post(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : PUT
  /// Params : url, map for parameters
  Future<Response> put(String url, Map<String, String> params) async {
    var response = await _dio!.put(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : DELETE
  /// Params : url, map for parameters
  Future<Response> delete(String url, Map<String, String> params) async {
    var response = await _dio!.delete(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }
}

/// Api Response codes
class ApiResponseCode {
  static const int success200 = 200;
  static const int success201 = 201;
  static const int error400 = 400;
  static const int error499 = 499;
  static const int error401 = 201;
  static const int error404 = 201;
  static const int error500 = 500;
  static const int internetUnavailable = 999;
  static const int unknown = 533;
}

final apiHelper = ApiBaseHelper();

