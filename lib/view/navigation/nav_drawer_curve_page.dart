import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/widgets/nav_drawer_curve_widget.dart';

class NavDrawerCurvePage extends StatefulWidget {
  @override
  State<NavDrawerCurvePage> createState() => _NavDrawerCurvePageState();
}

class _NavDrawerCurvePageState extends State<NavDrawerCurvePage> {
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: StringConst.NAV_DRAWER_CURVE_TITLE),
      drawer: NavDrawerCurveWidgt(),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return Container();
  }
}
