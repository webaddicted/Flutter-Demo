import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbeginner/global/animation/delayed_animation.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';
class SplashPage1 extends StatefulWidget {
  @override
  _SplashPage1State createState() => _SplashPage1State();
}

class _SplashPage1State extends State<SplashPage1>  with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: Color(0xFF8185E2),
      body: _createUi(),
    );
  }

  Widget _createUi() {
    final color = Colors.white;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AvatarGlow(
            endRadius: 90,
            duration: Duration(seconds: 2),
            glowColor: Colors.white24,
            repeat: true,
            repeatPauseDuration: Duration(seconds: 2),
            startDelay: Duration(seconds: 1),
            child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: FlutterLogo(
                    size: 50.0,
                  ),
                  radius: 50.0,
                )),
          ),
          DelayedAnimation(
            child: Text(
              "Hi There",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25.0, color: color),
            ),
            delay: delayedAmount + 1000,
          ),
          DelayedAnimation(
            child: Text(
              "I'm Reflectly",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25.0, color: color),
            ),
            delay: delayedAmount + 2000,
          ),
          SizedBox(
            height: 30.0,
          ),
          DelayedAnimation(
            child: Text(
              "Your New Personal",
              style: TextStyle(fontSize: 20.0, color: color),
            ),
            delay: delayedAmount + 3000,
          ),
          DelayedAnimation(
            child: Text(
              "Journaling  companion",
              style: TextStyle(fontSize: 20.0, color: color),
            ),
            delay: delayedAmount + 3000,
          ),
          SizedBox(
            height: 80.0,
          ),
          DelayedAnimation(
            child: GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              child: Transform.scale(
                scale: _scale,
                child: _animatedButtonUI,
              ),
            ),
            delay: delayedAmount + 4000,
          ),
          SizedBox(
            height: 50.0,
          ),
          DelayedAnimation(
            child: Text(
              "I Already have An Account".toUpperCase(),
              style: TextStyle(
                  fontSize: 18.0, fontWeight: FontWeight.bold, color: color),
            ),
            delay: delayedAmount + 5000,
          ),
          SizedBox(
            height: 20.0,
          ),
          AvatarGlow(
            endRadius: 60,
            duration: Duration(seconds: 5),
            glowColor: Colors.white24,
            repeat: true,
//            repeatPauseDuration: Duration(seconds: 1),
            startDelay: Duration(seconds: 1),
            child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: ColorConst.APP_COLOR,
                  radius: 30,
                  child: IconButton(
                      icon: Icon(Icons.play_arrow),
                      color: ColorConst.WHITE_COLOR,
                      onPressed: () {
                        navigationPush(context, LoginPage3());
                      }),
                )),
          ),
        ],
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
    height: 50,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        StringConst.APP_NAME,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8185E2),
        ),
      ),
    ),
  );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
