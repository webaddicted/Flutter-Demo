import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/stepper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class StepperView extends StatefulWidget {
  @override
  _StepperViewState createState() => _StepperViewState();
}

class _StepperViewState extends State<StepperView> {

  BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        getAppBarWithBackBtn(ctx:context,title: StringConst.STEPPER_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        )
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return new Container(
      child: SingleChildScrollView(
        child:
            TopStepper(),
      ),
    );
  }

}
class TopStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: HorizontalStepper(
            steps: [
              HorizontalStep(
                title: "Pick Image",
                widget: Center(
                  child: Text("Step 1"),
                ),
                state: HorizontalStepState.SELECTED,
                isValid: true,
              ),
              HorizontalStep(
                title: "Fill Form",
                widget: Center(
                  child: Text("Step 2"),
                ),
                isValid: true,
              ),
              HorizontalStep(
                title: "Get Details ",
                widget: Center(
                  child: Text("Step 3"),
                ),
                isValid: true,
              ),
              HorizontalStep(
                title: "Find Location",
                widget: Center(
                  child: Text("Step 4"),
                ),
                isValid: true,
              )
            ],
            selectedColor: const Color(0xFF4FE2C0),
            unSelectedColor: Colors.grey.shade400,
            leftBtnColor: const Color(0xffEA7F8B),
            rightBtnColor: const Color(0xFF4FE2C0),
            selectedOuterCircleColor: const Color(0xFF40A8F4),
            type: Type.TOP,
            circleRadius: 30,
            onComplete: () {
              print("completed");
            },
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: null,
            )),
    );
  }
}
