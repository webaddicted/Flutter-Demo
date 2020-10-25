import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page1.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page2.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/login/login_page2.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';
import 'package:flutterbeginner/view/login/login_page4.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class BottomNavPage extends StatelessWidget {
  List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return new Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_NAV_DESIGN_TITLE),
      body: HomeItemWidget(
        dataBean: dataBean,
        onTap: (screenName) => nextScreen(context, screenName),
      ),
    );
  }

  List<String> setData() {
    dataBean = new List();
    dataBean.add("Bottom Nav Page1");
    dataBean.add("Bottom Nav Page2");
    dataBean.add("Bottom Nav Page3");
    dataBean.add("Bottom Nav Page4");
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Bottom Nav Page1':
        return navigationPush(context, BottomNavPage1());
      case 'Bottom Nav Page2':
        return navigationPush(context, BottomNavPage2());
      case 'Bottom Nav Page13':
        return navigationPush(context, LoginPage3());
      case 'Bottom Nav Page4':
        return navigationPush(context, LoginPage4());
      default:
        return navigationPush(context, LoginPage1());
        break;
    }
  }
}
