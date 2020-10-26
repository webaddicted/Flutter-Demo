import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page4.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class OnboardingPage3 extends StatefulWidget {
  @override
  _OnboardingPage3State createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset(AssetsConst.SLIDER4_IMG),
        body: getTxtWhiteColor(
            msg:
                'Haselfree  booking  of  flight  tickets  with  full  refund  on  cancelation',
            fontSize: 16,
            fontWeight: FontWeight.w500),
        title: getTxtWhiteColor(
            msg: 'Flights', fontWeight: FontWeight.bold, fontSize: 18),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          AssetsConst.SLIDER4_IMG,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: AssetsConst.SLIDER5_IMG,
      body: getTxtWhiteColor(
          msg:
              'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
          fontSize: 16,
          fontWeight: FontWeight.w500),
      title: getTxtWhiteColor(
          msg: 'Hotels', fontWeight: FontWeight.bold, fontSize: 18),
      mainImage: Image.asset(
        AssetsConst.SLIDER5_IMG,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: AssetsConst.SLIDER6_IMG,
      body: getTxtWhiteColor(
          msg:
              'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
          fontSize: 16,
          fontWeight: FontWeight.w500),
      title: getTxtWhiteColor(
          msg: 'Cabs', fontWeight: FontWeight.bold, fontSize: 18),
      mainImage: Image.asset(
        AssetsConst.SLIDER6_IMG,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage4(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
