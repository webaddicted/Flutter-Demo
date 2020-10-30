
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page1.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page4.dart';
import 'package:flutterbeginner/view/pulltorefresh/pull_to_refresh.dart';
import 'package:flutterbeginner/view/pulltorefresh/water_drop.dart';
import 'package:flutterbeginner/view/pulltorefresh/water_drop_material.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class PullToRefreshPage extends StatelessWidget {
  List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return  Scaffold(
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
    dataBean.add("Pull to refresh default");
    dataBean.add("Water drop material");
    dataBean.add("Water drop");
    dataBean.add("Onboarding Page4");
    dataBean.add("Onboarding Page5");
    dataBean.add("Onboarding Page6");
    dataBean.add("Onboarding Page7");

    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Pull to refresh default':
        return navigationPush(context, PullToRefresh());
      case 'Water drop material':
        return navigationPush(context, WaterDropMaterial());
      case 'Water drop':
        return navigationPush(context, WaterDrop());
      case 'Onboarding Page4':
        return navigationPush(context, OnboardingPage4());
      default:
        return navigationPush(context, OnboardingPage1());
        break;
    }
  }
}
