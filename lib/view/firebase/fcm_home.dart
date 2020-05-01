import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class FcmHome extends StatefulWidget {
  @override
  _FcmHomeState createState() => _FcmHomeState();
}

class _FcmHomeState extends State<FcmHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.HOME_TITLE),
    );
  }
}
