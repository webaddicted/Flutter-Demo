import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';
//import 'package:simple_animations/simple_animations.dart';
//import 'package:simple_animations/simple_animations/controlled_animation.dart';
// import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return MirrorAnimationBuilder<Color>(
    //   tween: ColorTween(begin: Colors.red, end: Colors.blue), // red to blue
    //   duration:Duration(milliseconds: (500 * delay).round()), // for 5 seconds per iteration
    //   builder: (context, value, _) {
    //     return  Opacity(
    //         opacity: 0.8,
    //         child: Transform.translate(
    //         offset: Offset(0, 100),
    //     child: child
    //     ));
    //   },
    // );
  }
}