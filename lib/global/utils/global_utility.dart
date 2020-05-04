import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/countries_bean.dart';
import 'package:image_picker/image_picker.dart';

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

//{START IMAGE PICKER}
imagePickDialog(BuildContext context, Function selectedfile) {
  showDialog(
      context: context,
      child: new AlertDialog(
          title: getTxtBlackColor('Select Option', null, FontWeight.bold),
          content: Container(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  getImageFromCamera(context, 0, selectedfile);
                },
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: getTxtBlackColor('Take Photo', 15, null)),
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              GestureDetector(
                  onTap: () {
                    getImageFromCamera(context, 1, selectedfile);
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child:
                          getTxtBlackColor('Choose From Gallery', 15, null))),
            ],
          ))));
}

Future getImageFromCamera(
    BuildContext context, int imageType, Function selectedfile) async {
  Navigator.pop(context);
  var image = await ImagePicker.pickImage(
      source: imageType == 0 ? ImageSource.camera : ImageSource.gallery);
  selectedfile(image);
}
//{END IMAGE PICKER}
