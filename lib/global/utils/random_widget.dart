import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';

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





Widget dummyRaisedBtn(String txt, Color btnColor) {
  return ButtonTheme(
    minWidth: double.infinity,
    height: 45,
    child: RaisedButton(
      color: btnColor,
      child: getTxtWhiteColor(msg:txt, fontSize: 15,fontWeight: FontWeight.bold),
      onPressed: () {},
    ),
  );
}



