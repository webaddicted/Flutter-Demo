import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/slide_dots.dart';
import 'package:flutterbeginner/global/customview/slide_item.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';
import 'package:nice_intro/intro_screen.dart';
import 'package:nice_intro/intro_screens.dart';

class OnboardingPage6 extends StatefulWidget {
  @override
  _OnboardingPage6State createState() => _OnboardingPage6State();
}

class _OnboardingPage6State extends State<OnboardingPage6> {
  @override
  Widget build(BuildContext context) {
    var screens = IntroScreens(
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginPage3(),
        ),
      ),
      onSkip: () => print('Skipping the intro slides'),
      footerBgColor: Colors.blue.withOpacity(0.6),
      activeDotColor: Colors.white,
      footerRadius: 18.0,
//      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
          title: 'Search',
          imageAsset: AssetsConst.SLIDER4_IMG,
          description: 'Quickly find all your messages',
          headerBgColor: Colors.white,
        ),
        IntroScreen(
          title: 'Focused Inbox',
          headerBgColor: Colors.white,
          imageAsset: AssetsConst.SLIDER5_IMG,
          description: "We've put your most important, actionable emails here",
        ),
        IntroScreen(
          title: 'Social',
          headerBgColor: Colors.white,
          imageAsset: AssetsConst.SLIDER6_IMG,
          description: "Keep talking with your mates",
        ),
      ],
    );

    return Scaffold(
      body: screens,
    );
  }
}
