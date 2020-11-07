import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx: context, title: 'Animation Page'),
        body: _createUi());
  }

  Widget _createUi() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Animator(
            triggerOnInit: true,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            tween: Tween<double>(begin: -1, end: 0),
            builder: (context, state, child) {
              return FractionalTranslation(
                  translation: Offset(state.value, 0), child: child);
            },
            child: edtPwdField(TextEditingController(), false, changeData),
          ),
          const SizedBox(height: 10.0),
          Animator(
            triggerOnInit: true,
            tween: Tween<double>(begin: 1, end: 0),
            builder: (context, state, child) {
              return FractionalTranslation(
                translation: Offset(state.value, 0),
                child: child,
              );
            },
            child: edtPwdField(TextEditingController(), false, changeData),
          ),
        ],
      ),
    );
  }

  changeData() {
    setState(() {});
  }
}
