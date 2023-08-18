class CoronaRespo {
  Global? global;
  List<Countries>? countries;
  String? date;

  CoronaRespo({this.global, this.countries, this.date});

  CoronaRespo.fromJson(Map<String, dynamic> json) {
    global =
    json['Global'] != null ? Global.fromJson(json['Global']) : null;
    if (json['Countries'] != null) {
      countries = [];
      json['Countries'].forEach((v) {
        countries?.add(Countries.fromJson(v));
      });
    }
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (global != null) {
      data['Global'] = global?.toJson();
    }
    if (countries != null) {
      data['Countries'] = countries?.map((v) => v.toJson()).toList();
    }
    data['Date'] = date;
    return data;
  }
}

class Global {
  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;

  Global(
      {this.newConfirmed,
        this.totalConfirmed,
        this.newDeaths,
        this.totalDeaths,
        this.newRecovered,
        this.totalRecovered});

  Global.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    return data;
  }
}

class Countries {
  String? country;
  String? countryCode;
  String? slug;
  int? newConfirmed;
  int? totalConfirmed;
  int? newDeaths;
  int? totalDeaths;
  int? newRecovered;
  int? totalRecovered;
  String? date;

  Countries(
      {this.country,
        this.countryCode,
        this.slug,
        this.newConfirmed,
        this.totalConfirmed,
        this.newDeaths,
        this.totalDeaths,
        this.newRecovered,
        this.totalRecovered,
        this.date});

  Countries.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    slug = json['Slug'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Slug'] = slug;
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    data['Date'] = date;
    return data;
  }
}
