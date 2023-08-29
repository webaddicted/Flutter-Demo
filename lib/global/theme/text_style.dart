import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';


class AppTextStyle {
  //normal text styles
  static const TextStyle normalBlack8 = TextStyle(
    color: ColorConst.blackColor,
    fontSize: kIsWeb ? 8 : 11,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle normalBlack10 = TextStyle(
    color: ColorConst.blackColor,
    fontSize: kIsWeb ? 10 : 13,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle normalBlack12 = TextStyle(
    color: ColorConst.blackBean,
    fontSize: kIsWeb ? 12 : 15,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normalGrey12 = TextStyle(
    color: ColorConst.grey,
    fontSize: kIsWeb ? 12 : 15,
    fontWeight: FontWeight.normal,
  );

 }
