
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer_bothside.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class NavigationPage extends StatelessWidget {
  final List<String> dataBean = new List();

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
    dataBean.add("One side");
    dataBean.add("Both side");
    dataBean.add("Curve Navigation");
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'One side':
        return navigationPush(context, NavigationDrawerScreen());
      case 'Both side':
        return navigationPush(context, BothSideNavDrawerScreen());
      // case 'Curve Navigation':
      //   return navigationPush(context, NavigationDrawerScreen());
      default:
        return showSnackBar(context, "Pending Task");
        break;
    }
  }
}
