class MovieRespo {
  int? page;
  int? totalResults;
  int? totalPages;
  List<Movie>? results;

  MovieRespo({this.page, this.totalResults, this.totalPages, this.results});

  MovieRespo.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Movie {
  int? voteCount;
  int? id;
  bool? video;
  var voteAverage;
  String? title;
  double? popularity;
  String? posterPath;
  String? originalLanguage;
  String? originalTitle;
  List<int>? genreIds;
  String? backdropPath;
  bool? adult;
  String? overview;
  String? releaseDate;

  Movie(
      {this.voteCount,
        this.id,
        this.video,
        this.voteAverage,
        this.title,
        this.popularity,
        this.posterPath,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.backdropPath,
        this.adult,
        this.overview,
        this.releaseDate});

  Movie.fromJson(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'];
    title = json['title'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vote_count'] = voteCount;
    data['id'] = id;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['genre_ids'] = genreIds;
    data['backdrop_path'] = backdropPath;
    data['adult'] = adult;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    return data;
  }
}

