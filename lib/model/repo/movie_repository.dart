import 'dart:convert';

import 'package:flutterbeginner/global/apiutils/api_base_helper.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/model/BooksRespo.dart';
import 'package:flutterbeginner/model/bean/movie/movie_req.dart';
import 'package:flutterbeginner/model/bean/movie/movie_respo.dart';

class MovieRepository {
  provicerFetchMovieList() async {
    try {
      final response = await apiHelper.getWithParam(
          "${ApiConstant.POPULAR_MOVIES}",
          Movie_req(ApiConstant.API_KEY).toMap());
      if (response.statusCode == ApiRespoCode.no_internet_connection)
        return ApiResponse.error(
            errCode: response.statusCode,
            errMsg: ApiConstant.NoInternetConnection,
            data: null);
      return ApiResponse.returnResponse(
          response, MovieRespo.fromJson(jsonDecode(response.toString())));
    } catch (error, stacktrace) {
      return ApiResponse.error(
          errCode: ApiRespoCode.known,
          errMsg: error.toString(),
          errBdy: stacktrace.toString(),
          data: null);
    }
  }

  getBookInfoPlaying({String endPoint, int page}) async {
    try {
      print("try COMPLETED");
      final response = await apiHelper.get(
          'https://www.googleapis.com/books/v1/volumes?maxResults=40&q=chacha%20chaudhary');
      print("catch response $response");
      return ApiResponse.returnResponse(
          response, BooksRespo.fromJson(jsonDecode(response.toString())));
    } catch (error, stacktrace) {
      print("catch COMPLETED $error");
      return ApiResponse.error(
          errCode: ApiRespoCode.known,
          errMsg: error.toString(),
          errBdy: stacktrace.toString(),
          data: null);
    }
  }
}
