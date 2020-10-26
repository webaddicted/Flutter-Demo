
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
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class OnboardingPage extends StatelessWidget {
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
    dataBean.add("Onboarding Page1");
    dataBean.add("Onboarding Page2");
    dataBean.add("Onboarding Page3");
    dataBean.add("Onboarding Page4");
    dataBean.add("Onboarding Page5");
    dataBean.add("Onboarding Page6");
    dataBean.add("Onboarding Page7");

    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Onboarding Page1':
        return navigationPush(context, OnboardingPage1());
      case 'Onboarding Page2':
        return navigationPush(context, OnboardingPage2());
      case 'Onboarding Page3':
        return navigationPush(context, OnboardingPage3());
      case 'Onboarding Page4':
        return navigationPush(context, OnboardingPage4());
      case 'Onboarding Page5':
        return navigationPush(context, OnboardingPage5());
      case 'Onboarding Page6':
        return navigationPush(context, OnboardingPage6());
      case 'Onboarding Page7':
        return navigationPush(context, OnboardingPage7());
      default:
        return navigationPush(context, OnboardingPage1());
        break;
    }
  }
}
