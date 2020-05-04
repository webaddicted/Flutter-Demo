import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/countries_bean.dart';

Widget bgDesign() {
  return Stack(
    children: <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: 150,
          width: 150,
          transform: Matrix4.translationValues(-50, -50, 0.0),
          decoration: BoxDecoration(
              color: ColorConst.CIRCLE_FADE1, shape: BoxShape.circle),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 200,
          width: 200,
          transform: Matrix4.translationValues(-50, -100, 0.0),
          decoration: BoxDecoration(
              color: ColorConst.CIRCLE_FADE1, shape: BoxShape.circle),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 150,
          width: 150,
          transform: Matrix4.translationValues(50, 50, 0.0),
          decoration: BoxDecoration(
              color: ColorConst.CIRCLE_FADE1, shape: BoxShape.circle),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 150,
          width: 150,
          transform: Matrix4.translationValues(50, 150, 0),
          decoration: BoxDecoration(
              color: ColorConst.CIRCLE_FADE1, shape: BoxShape.circle),
        ),
      ),
    ],
  );
}


Widget selectCountryDropDown(CountryBean country, Function onPressed) => Card(
  child: InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.only(
          left: 4.0, right: 4.0, top: 12.0, bottom: 12.0),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(' ${country.flag}  ${country.name} ')),
          Icon(Icons.arrow_drop_down, size: 24.0)
        ],
      ),
    ),
  ),
);

Widget selectableWidget(
    CountryBean country, Function(CountryBean) selectThisCountry) =>
    Material(
      color: Colors.white,
      type: MaterialType.canvas,
      child: InkWell(
        onTap: () => selectThisCountry(country), //selectThisCountry(country),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          child: Text(
            "  " +
                country.flag +
                "  " +
                country.name +
                " (" +
                country.dialCode +
                ")",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );

Widget searchCountry(TextEditingController controller) => Padding(
  padding:
  const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 2.0, right: 8.0),
  child: Card(
    child: TextFormField(
      autofocus: true,
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Search your country',
          contentPadding: const EdgeInsets.only(
              left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
          border: InputBorder.none),
    ),
  ),
);

Widget dummyRaisedBtn(String txt, Color btnColor) {
  return ButtonTheme(
    minWidth: double.infinity,
    height: 45,
    child: RaisedButton(
      color: btnColor,
      child: getTxtWhiteColor(txt, 15, FontWeight.bold),
      onPressed: () {},
    ),
  );
}



