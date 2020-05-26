import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/circle_progress_bar.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ProgressBarWidget extends StatefulWidget {
  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  BuildContext _ctx;
  double index = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.PROGRESS_BAR_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        padding: EdgeInsets.all(5.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(
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
        SizedBox(height: 10),
//        Stack(
//          alignment: Alignment.center,
//          children: <Widget>[
        Container(
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
        SizedBox(height: 10),
        LinearProgressIndicator(),
        SizedBox(height: 10),
        CircularProgressIndicator(),
        SizedBox(height: 10),
        CircularProgressIndicator(
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.orange,
          ),
          value: 0.50,
        ),
        SizedBox(height: 10),
        LinearProgressIndicator(
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.orange,
          ),
          value: 0.50,
        ),
        SizedBox(height: 10),
        _lineIndicator(),
        SizedBox(height: 10),
        _circleIndicator(),
        SizedBox(height: 10),
        _getSlider(),
        SizedBox(height: 10),
      ],
    );
  }
  Widget _lineIndicator() => Container(
    constraints: BoxConstraints.expand(height: 10),
    child: LinearProgressIndicator(
      backgroundColor: Colors.grey,
      value: 0.50,
    ),
  );

  Widget _circleIndicator() => Container(
    constraints: BoxConstraints.expand(width: 100, height: 100),
    child: CircularProgressIndicator(
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
        print("newValue= $newValue");
        setState(() {
          index = newValue;
        });
      },
      label: "${index.round()} Dollar",
      onChangeStart: (value) {
        print("start = $value");
      },
      onChangeEnd: (endValue) {
        print("end = $endValue");
      },
      divisions: 100,
      semanticFormatterCallback: (value) {
        return "$value hello";
      },
    );
  }
}
