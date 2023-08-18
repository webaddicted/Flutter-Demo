class CountryBean {
  String? name, code, dialCode, flag;

  CountryBean({this.name, this.code, this.dialCode, this.flag});

  factory CountryBean.fromJson(Map<String, dynamic> json) => CountryBean(
      name: json["name"],
      code: json["code"],
      dialCode: json["dial_code"],
      flag: json["flag"]);

  @override
  String toString() {
    return 'Country{name: $name, code: $code, dialCode: $dialCode}';
  }
}
