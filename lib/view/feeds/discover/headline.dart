import 'package:flutter/cupertino.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

Widget headLine(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getTxtBlackColor(
          msg: title,
          fontSize: 22,
          fontWeight: FontWeight.w600
          // style: AppTextStyle.headline,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 36,
          height: 2.5,
          color: ColorConst.appColor,
        ),
      ],
    ),
  );
}
