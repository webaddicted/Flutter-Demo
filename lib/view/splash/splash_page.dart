
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page1.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page2.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page3.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page4.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page5.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page6.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page7.dart';
import 'package:flutterbeginner/view/splash/splash_page1.dart';
import 'package:flutterbeginner/view/splash/splash_page2.dart';
import 'package:flutterbeginner/view/splash/splash_page3.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class SplashPage extends StatelessWidget {
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
    dataBean.add("Splash Page1");
    dataBean.add("Splash Page2");
    dataBean.add("Splash Page3");
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Splash Page1':
        return navigationPush(context, SplashPage1());
      case 'Splash Page2':
        return navigationPush(context, SplashPage2());
      case 'Splash Page3':
        return navigationPush(context, SplashPage3());
      default:
        return navigationPush(context, OnboardingPage1());
        break;
    }
  }
}
