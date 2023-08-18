import 'package:flutter/material.dart';
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
          edtPwdField(TextEditingController(), false, changeData),
          const SizedBox(height: 10.0),
          edtPwdField(TextEditingController(), false, changeData),
        ],
      ),
    );
  }

  changeData() {
    setState(() {});
  }
}
