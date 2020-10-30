import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage2 extends StatefulWidget {
  @override
  _SplashPage2State createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.SP_TITLE),
        body: Builder(
      builder: (context) => _createUi(context),
    ));
  }

  Widget _createUi(BuildContext context) {
    // _ctx = context;
    return Splash1();
  }
}

class Splash1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: LoginPage3(),
      image: Image.asset(AssetsConst.SLIDER6_IMG),
      photoSize: 150.0,
      loadingText: getTxtWhiteColor(msg: 'loading...', fontSize: 22, fontWeight: FontWeight.bold),
      loaderColor: Colors.white,
      backgroundColor: Color.fromRGBO(187, 58, 123, 1),
    );
  }
}
