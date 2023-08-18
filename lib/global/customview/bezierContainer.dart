import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/customview/bezier_clipper.dart';


class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3.5,
      child: ClipPath(
    clipper: ClipPainter(),
    child: Container(
      height: MediaQuery.of(context).size.height * .5,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF4D0F29),
                Color(0xFF601A36)
          ])),
    ),
      ),
    );
  }
}
