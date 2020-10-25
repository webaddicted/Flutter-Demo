import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/model/BooksRespo.dart';
import 'package:flutterbeginner/model/bean/movie/movie_respo.dart';
import 'package:flutterbeginner/model/repo/movie_repository.dart';

class MovieProvider with ChangeNotifier {
  MovieRepository _movieRepo;
  ApiResponse<MovieRespo> _movieListRespo;
  ApiResponse<BooksRespo> _bookRespo;
  MovieProvider() {
    _movieRepo = MovieRepository();
    _movieListRespo = ApiResponse();
    _bookRespo = ApiResponse();
  }

  ApiResponse<MovieRespo> get getMovieRespo => _movieListRespo;

  fetchMovieList() async {
    _movieListRespo = ApiResponse.loading();
    _movieListRespo = await _movieRepo.provicerFetchMovieList();
    notifyListeners();
  }



  ApiResponse<BooksRespo> get getBookRespo => _bookRespo;

  fetchBookList() async {
    _bookRespo = ApiResponse.loading();
    notifyListeners();
    debugPrint("COMPLETED  :  ddd");
    _bookRespo = await _movieRepo.getBookInfoPlaying();
    notifyListeners();
  }
}
