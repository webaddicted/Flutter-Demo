import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  TextEditingController t1, t2;
  var num1 = 0, num2 = 0, sum = 0;
  BuildContext ctx;
  @override
  void initState() {
    super.initState();
    t1 = new TextEditingController(text: "0");
    t2 = new TextEditingController(text: "0");
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar:
        getAppBarWithBackBtn(context, StringConst.CALCULATOR_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        )
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return Scrollbar(
      child: new Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Output : $sum",
                  style: new TextStyle(
                      color: ColorConst.APP_COLOR,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                new Form(
                    child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      cursorColor: ColorConst.APP_COLOR,
                      style: new TextStyle(
                        fontSize: 15,
                        color: ColorConst.RED_COLOR,
                      ),
                      decoration:
                          new InputDecoration(labelText: "Enter Number 1 "),
                      maxLength: 20,
                      keyboardType: TextInputType.number,
                      controller: t1,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Enter Number 2 ",
                          fillColor: ColorConst.APP_COLOR),
                      cursorColor: ColorConst.GREEN_COLOR,
                      maxLength: 20,
                      keyboardType: TextInputType.number,
                      controller: t2,
                    )
                  ],
                )),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new MaterialButton(
                      color: ColorConst.APP_COLOR,
                      child: new Text(
                        "+",
                        style: new TextStyle(color: ColorConst.WHITE_COLOR),
                      ),
                      onPressed: () {
                        addition();
                      },
                    ),
                    new Padding(padding: EdgeInsets.only(left: 50)),
                    new MaterialButton(
                      color: ColorConst.APP_COLOR,
                      child: new Text(
                        "-",
                        style: new TextStyle(color: ColorConst.WHITE_COLOR),
                      ),
                      onPressed: () {
                        subtract();
                      },
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new MaterialButton(
                      color: ColorConst.APP_COLOR,
                      child: new Text(
                        "*",
                        style: new TextStyle(color: ColorConst.WHITE_COLOR),
                      ),
                      onPressed: () {
                        multiply();
                      },
                    ),
                    new Padding(padding: EdgeInsets.only(left: 50)),
                    new MaterialButton(
                      color: ColorConst.APP_COLOR,
                      child: new Text(
                        "/",
                        style: new TextStyle(color: ColorConst.WHITE_COLOR),
                      ),
                      onPressed: () {
                        division();
                      },
                    ),
                  ],
                ),
//              new Flexible(
//                child:
                new MaterialButton(
                  color: ColorConst.APP_COLOR,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: new Text(
                        "clear",
                        style: new TextStyle(color: ColorConst.WHITE_COLOR),
                      ),
                    ),
                  ),
                  onPressed: () {
                    clearField();
                  },
//                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void subtract() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void multiply() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void division() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = (num1 ~/ num2);
    });
  }

  void clearField() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
      sum = 0;
    });
  }
}
