import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late TextEditingController t1, t2;
  var num1 = 0, num2 = 0, sum = 0;
  late BuildContext ctx;

  @override
  void initState() {
    super.initState();
    t1 = TextEditingController(text: "0");
    t2 = TextEditingController(text: "0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.CALCULATOR_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return Scrollbar(
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Output : $sum",
                  style: TextStyle(
                      color: ColorConst.appColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Form(
                    child: Column(
                  children: <Widget>[
                    TextFormField(
                      cursorColor: ColorConst.appColor,
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorConst.redColor,
                      ),
                      decoration:
                          InputDecoration(labelText: "Enter Number 1 "),
                      maxLength: 20,
                      keyboardType: TextInputType.number,
                      controller: t1,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Enter Number 2 ",
                          fillColor: ColorConst.appColor),
                      cursorColor: ColorConst.greenColor,
                      maxLength: 20,
                      keyboardType: TextInputType.number,
                      controller: t2,
                    )
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      color: ColorConst.appColor,
                      child: Text(
                        "+",
                        style: TextStyle(color: ColorConst.whiteColor),
                      ),
                      onPressed: () {
                        addition();
                      },
                    ),
                    Padding(padding: EdgeInsets.only(left: 50)),
                    MaterialButton(
                      color: ColorConst.appColor,
                      child: Text(
                        "-",
                        style: TextStyle(color: ColorConst.whiteColor),
                      ),
                      onPressed: () {
                        subtract();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      color: ColorConst.appColor,
                      child: Text(
                        "*",
                        style: TextStyle(color: ColorConst.whiteColor),
                      ),
                      onPressed: () {
                        multiply();
                      },
                    ),
                    Padding(padding: EdgeInsets.only(left: 50)),
                    MaterialButton(
                      color: ColorConst.appColor,
                      child: Text(
                        "/",
                        style: TextStyle(color: ColorConst.whiteColor),
                      ),
                      onPressed: () {
                        division();
                      },
                    ),
                  ],
                ),
//              new Flexible(
//                child:
                MaterialButton(
                  color: ColorConst.appColor,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "clear",
                        style: TextStyle(color: ColorConst.whiteColor),
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
