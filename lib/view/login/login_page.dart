
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/login/login_page2.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';
import 'package:flutterbeginner/view/login/login_page4.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class LoginPage extends StatelessWidget {
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
    dataBean.add("Login Page1");
    dataBean.add("Login Page2");
    dataBean.add("Login Page3");
    dataBean.add("Login Page4");
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Login Page1':
        return navigationPush(context, LoginPage1());
      case 'Login Page2':
        return navigationPush(context, LoginPage2());
      case 'Login Page3':
        return navigationPush(context, LoginPage3());
      case 'Login Page4':
        return navigationPush(context, LoginPage4());
      default:
        return navigationPush(context, LoginPage1());
        break;
    }
  }
}
