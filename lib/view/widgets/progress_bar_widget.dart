import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/circle_progress_bar.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ProgressBarWidget extends StatefulWidget {
  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  late BuildContext _ctx;
  double index = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context,title: StringConst.PROGRESS_BAR_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _getProgressBarType(),
              ],
            ),
          ),
        ));
  }
  Widget _getProgressBarType() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
//        Stack(
//          alignment: Alignment.center,
//          children: <Widget>[
        const SizedBox(
          width: 100,
          child: CircleProgressBar(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.blue,
            value: 0.70,
          ),
        ),
//            getTxtAppColor('${animation.value.toInt()} %', 25, FontWeight.bold)
//          ],
//        ),
        const SizedBox(height: 10),
        const LinearProgressIndicator(),
        const SizedBox(height: 10),
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        const CircularProgressIndicator(
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.orange,
          ),
          value: 0.50,
        ),
        const SizedBox(height: 10),
        const LinearProgressIndicator(
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.orange,
          ),
          value: 0.50,
        ),
        const SizedBox(height: 10),
        _lineIndicator(),
        const SizedBox(height: 10),
        _circleIndicator(),
        const SizedBox(height: 10),
        _getSlider(),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget _lineIndicator() => Container(
    constraints: const BoxConstraints.expand(height: 10),
    child: const LinearProgressIndicator(
      backgroundColor: Colors.grey,
      value: 0.50,
    ),
  );

  Widget _circleIndicator() => Container(
    constraints: const BoxConstraints.expand(width: 100, height: 100),
    child: const CircularProgressIndicator(
      value: 0.50,
      backgroundColor: Colors.grey,
//          valueColor: t.animate(_controller),
      strokeWidth: 10,
    ),
  );
  Widget _getSlider(){
    return Slider(
      value: index < 0.0 ? 0.0 : index,
      min: 0.0,
      max: 100.0,
      onChanged: (double newValue) {
        printLog(msg: "newValue= $newValue");
        setState(() {
          index = newValue;
        });
      },
      label: "${index.round()} Dollar",
      onChangeStart: (value) {
        printLog(msg: "start = $value");
      },
      onChangeEnd: (endValue) {
        printLog(msg: "end = $endValue");
      },
      divisions: 100,
      semanticFormatterCallback: (value) {
        return "$value hello";
      },
    );
  }
}
