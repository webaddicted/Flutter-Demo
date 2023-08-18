/// api_key : "asfdadasdsadad"

class Movie_req {
  String? _apiKey;

  String? get apiKey => _apiKey;

  Movie_req(this._apiKey);

  Movie_req.map(dynamic obj) {
    _apiKey = obj["api_key"];
  }

  Map<String, String> toMap() {
    var map = <String, String>{};
    map["api_key"] = _apiKey!;
    return map;
  }

}