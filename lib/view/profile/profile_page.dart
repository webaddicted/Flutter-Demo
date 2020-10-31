
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/login/login_page2.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';
import 'package:flutterbeginner/view/login/login_page4.dart';
import 'file:///D:/AndroidStudioProjects/flutter/flutterbeginner/lib/view/home/home_page1.dart';
import 'package:flutterbeginner/view/profile/profile_page1.dart';
import 'package:flutterbeginner/view/profile/profile_page2.dart';
import 'package:flutterbeginner/view/profile/profile_page3.dart';
import 'package:flutterbeginner/view/profile/profile_page4.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class ProfilePage extends StatelessWidget {
   List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return new Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.LOGIN_DESIGN_TITLE),
      body: HomeItemWidget(
        dataBean: dataBean,
        onTap: (screenName) => nextScreen(context, screenName),
      ),
    );
  }

  List<String> setData() {
    dataBean = new List();
    dataBean.add("Profile Page1");
    dataBean.add("Profile Page2");
    dataBean.add("Profile Page3");
    dataBean.add("Profile Page4");
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Profile Page1':
        return navigationPush(context, ProfilePage1());
      case 'Profile Page2':
        return navigationPush(context, ProfilePage2());
      case 'Profile Page3':
        return navigationPush(context, ProfilePage3());
      case 'Profile Page4':
        return navigationPush(context, ProfilePage4());
      default:
        return navigationPush(context, LoginPage1());
        break;
    }
  }
}
