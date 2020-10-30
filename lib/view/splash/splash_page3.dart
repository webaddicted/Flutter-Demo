import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';

class SplashPage3 extends StatefulWidget {
  @override
  _SplashPage3State createState() => _SplashPage3State();
}

class _SplashPage3State extends State<SplashPage3>
    with SingleTickerProviderStateMixin {
  var _visible = false;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return LoginPage3();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation = new CurvedAnimation(
        parent: animationController, curve: Curves.decelerate);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(137, 168, 73, 1),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loadCircleImg(
                  ApiConstant.WEBADDICTED_IMG, 0, animation.value * 200)
              // new Image.asset(
              //   AssetsConst.TAKE_PHONE,
              //   width: animation.value * 600,
              //   height: animation.value * 600,
              // ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 70),
              child: getTxtWhiteColor(
                  msg: "Camper Boys",
                  fontSize: 22,
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
