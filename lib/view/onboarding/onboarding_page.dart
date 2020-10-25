import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/login/login_page2.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page1.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class OnboardingPage extends StatelessWidget {
   List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return new Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.LOGIN_DESIGN_TITLE),
      body: HomeItemWidget(
        dataBean: dataBean,
        onTap: (screenName) => nextScreen(context, screenName),
      ),
    );
  }

  List<String> setData() {
    dataBean = new List();
    dataBean.add("Onboarding Page1");
    dataBean.add("Onboarding Page2");
    dataBean.add("Onboarding Page3");
    dataBean.add("Onboarding Page4");

    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Onboarding Page1':
        return navigationPush(context, OnboardingPage1());
      case 'Onboarding Page2':
        return navigationPush(context, OnboardingPage1());
      default:
        return navigationPush(context, OnboardingPage1());
        break;
    }
  }
}
