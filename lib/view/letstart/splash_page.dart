import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/sp/sp_manager.dart';
import 'package:flutterbeginner/view/alltask/all_task.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page7.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  var _visible = false;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var isOnBoardingShow = await SPManager.getOnboarding();
    Future.delayed(const Duration(seconds: 4), () {
      navigationPushReplacement(
          context,
          isOnBoardingShow != null && isOnBoardingShow
              ? AllTasks()
              : OnBoardingPage7());
    });
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
      backgroundColor: ColorConst.WHITE_COLOR,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: animation.value * 250,
                  height: animation.value * 250, //Adapt.px(500),
                  child: Image.asset(AssetsConst.LOGO_IMG)),
              const SizedBox(height: 180),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorConst.APP_COLOR),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
