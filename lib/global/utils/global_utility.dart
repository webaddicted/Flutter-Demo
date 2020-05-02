import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/model/countries_bean.dart';

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
Future<List<CountryBean>> loadCountriesJson(BuildContext context) async {
  List<CountryBean> _countryBean = List();
  var value = await DefaultAssetBundle.of(context)
      .loadString(AssetsConst.COUNTRY_PHONE_CODES_JSON);
  var countriesJson = jsonDecode(value);
  for (var country in countriesJson) {
    _countryBean.add(CountryBean.fromJson(country));
  }
  return _countryBean;
}
