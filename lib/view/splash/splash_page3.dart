import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';

class SplashPage3 extends StatefulWidget {
  @override
  State<SplashPage3> createState() => _SplashPage3State();
}

class _SplashPage3State extends State<SplashPage3>
    with SingleTickerProviderStateMixin {
  var _visible = false;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = const Duration(seconds: 4);
    return LoginPage3();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.decelerate);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(137, 168, 73, 1),
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
              margin: const EdgeInsets.only(bottom: 70),
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
