import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_arc_page2.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_fade_appbar.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_page3.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_zoom_img_page2.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapsetoolbar_page1.dart';
import 'package:flutterbeginner/view/collapsetoolbar/wave_appbar.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class CollapseToolbarPage extends StatelessWidget {
  List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.LIST_DESIGN_TITLE),
      body: HomeItemWidget(
        dataBean: dataBean,
        onTap: (screenName) => nextScreen(context, screenName),
      ),
    );
  }

  List<String> setData() {
    dataBean = new List();
    dataBean.add("Collapse toolbar1");
    dataBean.add("Collapse Arc Page2");
    dataBean.add("Collapse Zoom Img");
    dataBean.add("Collapse Page3");
    dataBean.add("Collapse Fade Appbar");
    dataBean.add("WaveAppbar");
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Collapse toolbar1':
        return navigationPush(context, CollapseToolbarPage1());
      case 'Collapse Arc Page2':
        return navigationPush(context, CollapseArcPage2());
      case 'Collapse Zoom Img':
        return navigationPush(context, CollapseZoomImg3());
      case 'Collapse Page3':
        return navigationPush(context, CollapsePage3());
      case 'Collapse Fade Appbar':
        return navigationPush(context, CollapseFadeAppBar());
      case 'WaveAppbar':
        return navigationPush(context, WaveAppbar());
      default:
        return navigationPush(context, LoginPage1());
        break;
    }
  }
}
