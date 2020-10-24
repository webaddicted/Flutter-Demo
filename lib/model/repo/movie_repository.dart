import 'dart:convert';

import 'package:flutterbeginner/global/apiutils/api_base_helper.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/model/bean/movie/movie_req.dart';
import 'package:flutterbeginner/model/bean/movie/movie_respo.dart';

class MovieRepository {
//  fetchMovieList(StreamSink<ApiResponse<MovieRespo>> respo) async {
//    respo.add(ApiResponse.loading(null));
//    try {
//      final response =
//      await apiHelper.getWithParam("${ApiConstant.POPULAR_MOVIES}",Movie_req(ApiConstant.API_KEY).toMap());
//      if(response.statusCode==ApiResponseCode.no_internet_connection){
//        respo.add(ApiResponse.error(
//            ApiError(response.statusCode, ApiConstant.NoInternetConnection, ApiConstant.NoInternetConnection), null));
//        return;
//      }
//      final dataRespo = apiHelper.returnResponse(
//          response, MovieRespo.fromJson(jsonDecode(response.toString())));
//      respo.add(dataRespo);
//    } catch (error, stacktrace) {
//      respo.add(ApiResponse.error(
//          ApiError(533, error.toString(), stacktrace.toString()), null));
//    }
//  }

  provicerFetchMovieList() async {
    try {
      final response = await apiHelper.getWithParam(
          "${ApiConstant.POPULAR_MOVIES}",
          Movie_req(ApiConstant.API_KEY).toMap());
      if (response.statusCode == ApiRespoCode.no_internet_connection)
        return ApiResponse.error(
            errCode: response.statusCode,
            errMsg: ApiConstant.NoInternetConnection,
            data:null);
      return ApiResponse.returnResponse(
          response, MovieRespo.fromJson(jsonDecode(response.toString())));
    } catch (error, stacktrace) {
      return ApiResponse.error(
          errCode: ApiRespoCode.known,
          errMsg: error.toString(),
          errBdy: stacktrace.toString(),
      data:null);
    }
  }
}
