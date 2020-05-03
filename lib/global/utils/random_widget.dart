
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

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
Widget getCircularImage(double size, File fileImage) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.all(new Radius.circular(size / 2)),
      border: new Border.all(
        color: ColorConst.FCM_APP_COLOR,
        width: 4.0,
      ),
    ),
    child: ClipOval(child: fileImage!=null?Image.file(fileImage, fit: BoxFit.cover):loadCircleImg(ApiConst.DEMO_IMG, 0, 80)),
  );
}
Widget getCircularImageClick(double size, Function pickImage) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.all(new Radius.circular(size / 2)),
      border: new Border.all(
        color: ColorConst.FCM_APP_COLOR,
        width: 2.0,
      ),
    ),
    child: ClipOval(child: IconButton(icon: Icon(Icons.image, color: Colors.grey,),
         onPressed: pickImage)),
  );
}