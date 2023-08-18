import 'dart:convert';

import 'package:flutterbeginner/global/apiutils/api_base_helper.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/model/BooksRespo.dart';
import 'package:flutterbeginner/model/bean/movie/movie_req.dart';
import 'package:flutterbeginner/model/bean/movie/movie_respo.dart';

class MovieRepository {
  provicerFetchMovieList() async {
    // try {
    //   final response = await apiHelper.getWithParam(url=ApiConstant.POPULAR_MOVIES);
    //   if (response?.statusCode == ApiResponseCode.error500) {
    //     return ApiResponse.error(
    //         errCode: response!.statusCode!,
    //         errMsg: ApiConstant.NoInternetConnection,
    //         data: null);
    //   }
    //   return ApiResponse.returnResponse(
    //       response!, MovieRespo.fromJson(jsonDecode(response.toString())));
    // } catch (error, stacktrace) {
    //   return ApiResponse.error(
    //       errCode: ApiResponseCode.error500,
    //       errMsg: error.toString(),
    //       errBdy: stacktrace.toString(),
    //       data: null);
    // }
  }
  allCity(String employeeId) async {
    var map = <String, String>{};
    map['employee_id'] = employeeId;
    map['device_id'] = 'await deviceId()';
    // final response =
    //     await apiHelper.post(url: "${ApiConstant.ABOUT_US}", params: map);

    // return ApiResponse.returnResponse(
    //     response,
    //     response.data == null
    //         ? null
    //         : UpdateProfileReq.fromJson(jsonDecode(response.toString())));
  }
  getBookInfoPlaying({String? endPoint, int? page}) async {
    try {
      printLog(msg: "try COMPLETED");
      final response = await apiHelper.getWithoutParams(
          'https://www.googleapis.com/books/v1/volumes?maxResults=40&q=chacha%20chaudhary');
      printLog(msg: "catch response $response");
      return ApiResponse.returnResponse(
          response!, BooksRespo.fromJson(jsonDecode(response.toString())));
    } catch (error, stacktrace) {
      printLog(msg: "catch COMPLETED $error");
      return ApiResponse.error(
          errCode: ApiResponseCode.error400,
          errMsg: error.toString(),
          errBdy: stacktrace.toString(),
          data: null);
    }
  }
}
