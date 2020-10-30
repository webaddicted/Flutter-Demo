
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/navigation/nav_behavior_page.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer_bothside.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer_curve_page.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer_slide_page.dart';
import 'package:flutterbeginner/view/navigation/nav_back_drop_drawer.dart';
import 'package:flutterbeginner/view/navigation/nav_drop_down.dart';
import 'package:flutterbeginner/view/navigation/nav_like_frag_page.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class NavigationPage extends StatelessWidget {
  List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return new Scaffold(
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
    dataBean.add("One side");
    dataBean.add("Both side");
    dataBean.add("Curve Navigation");
    dataBean.add("Slide Navigation");
    dataBean.add("Nav drawer same like fragment");
    dataBean.add("Nav Behavior");
    dataBean.add("Back Drop Drawer");
    dataBean.add('Drop Down Drawer');
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'One side':
        return navigationPush(context, NavDrawerScreen());
      case 'Both side':
        return navigationPush(context, BothSideNavDrawerScreen());
      case 'Curve Navigation':
        return navigationPush(context, NavDrawerCurvePage());
      case 'Slide Navigation':
        return navigationPush(context, NavDrawerSlidePage());
      case 'Nav drawer same like fragment':
        return navigationPush(context, NavLikeFragPage());
      case 'Nav Behavior':
        return navigationPush(context, NavBehaviorPage());
      case 'Back Drop Drawer':
        return navigationPush(context, NavBackDropDrawer());
      case 'Drop Down Drawer':
        return navigationPush(context, NavigDropDown());
      default:
        return showSnackBar(context, "Pending Task");
        break;
    }
  }
}
