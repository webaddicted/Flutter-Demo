import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/model/bean/movie/movie_respo.dart';
import 'package:flutterbeginner/model/repo/movie_repository.dart';

class MovieProvider with ChangeNotifier {
  MovieRepository _movieRepo;
  ApiResponse<MovieRespo> _movieListRespo;

  MovieProvider() {
    _movieRepo = MovieRepository();
    _movieListRespo = ApiResponse();
  }

  ApiResponse<MovieRespo> get getJsonResonse => _movieListRespo;

  fetchMovieList() async {
    _movieListRespo = ApiResponse.loading();
    _movieListRespo = await _movieRepo.provicerFetchMovieList();
    notifyListeners();
  }
}
