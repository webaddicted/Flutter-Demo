import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page1.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page2.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page3.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page4.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page5.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page6.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page7.dart';
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
    dataBean.add("Bottom Nav Page5");
    dataBean.add("Bottom Nav Page6");
    dataBean.add("Bottom Nav Page7");
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Bottom Nav Page1':
        return navigationPush(context, BottomNavPage1());
      case 'Bottom Nav Page2':
        return navigationPush(context, BottomNavPage2());
      case 'Bottom Nav Page3':
        return navigationPush(context, BottomNavPage3());
      case 'Bottom Nav Page4':
        return navigationPush(context, BottomNavPage4());
      case 'Bottom Nav Page5':
        return navigationPush(context, BottomNavPage5());
      case 'Bottom Nav Page6':
        return navigationPush(context, BottomNavPage6());
      case 'Bottom Nav Page7':
        return navigationPush(context, BottomNavPage7());
      default:
        return navigationPush(context, BottomNavPage1());
        break;
    }
  }
}
