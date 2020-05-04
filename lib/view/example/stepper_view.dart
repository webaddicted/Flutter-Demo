import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class StepperView extends StatefulWidget {
  @override
  _StepperViewState createState() => _StepperViewState();
}

class _StepperViewState extends State<StepperView> {
  int _current_step = 0;
  int _current_step_hori = 0;
  List<Step> _steps = [
    Step(
        title: getTxt("Step 1", null),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
          ],
        ),
        isActive: true),
    Step(
      title: getTxt("Step 2", null),
      content: getTxt("Content 2", null),
    ),
    Step(
        title: getTxt("Step 3", null),
        content: getTxt("Content 3", null),
        state: StepState.complete,
        isActive: true),
    Step(
        title: getTxt("Step 4", null),
        content: getTxt("Content 4", null),
        state: StepState.editing),
    Step(
        title: getTxt("Step 5", null),
        content: getTxt("Content 5", null),
        state: StepState.error),
  ];
  List<Step> _stepsHori = [
    Step(
        title: getTxt("Step 1", null),
        content: TextFormField(
          decoration: InputDecoration(labelText: 'Email Address'),
        ),
        isActive: true),
    Step(
      title: getTxt("Step 2", null),
      content: TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
      ),
    ),
//    Step(
//        title: getTxt("Step 3", null),
//        content: getTxt("Content 3", null),
//        state: StepState.complete,
//        isActive: true),
//    Step(
//        title: getTxt("Step 4", null),
//        content: getTxt("Content 4", null),
//        state: StepState.editing),
//    Step(
//        title: getTxt("Step 5", null),
//        content: getTxt("Content 5", null),
//        state: StepState.error),
  ];

  BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        getAppBarWithBackBtn(context, StringConst.STEPPER_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        )
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return new Container(
      child: Scrollbar(
        child: Column(
          children: <Widget>[
            Stepper(
              steps: _steps,
              currentStep: _current_step,
              type: StepperType.vertical,
              onStepTapped: (index) {
                setState(() {
                  _current_step = index;
                });
              },
              onStepCancel: () {
                showAlertDialog(context, 'Step Cancel', 'You cancel this step');
              },
              onStepContinue: () {
                showAlertDialog(context, 'Step Continue', 'Continue this step');
              },
              // custom view
              controlsBuilder: (BuildContext context,
                      {VoidCallback onStepContinue,
                      VoidCallback onStepCancel}) =>
                  Container(),
            ),

            Expanded(
              child: Stepper(
                steps: _stepsHori,
                currentStep: _current_step_hori,
                type: StepperType.horizontal,
                onStepTapped: (index) {
                  setState(() {
                    _current_step_hori = index;
                  });
                },
                onStepCancel: () {
                  showAlertDialog(
                      context, 'Step Cancel', 'You cancel this step');
                },
                onStepContinue: () {
                  showAlertDialog(
                      context, 'Step Continue', 'Continue this step');
                },
                // custom view
//                controlsBuilder: (BuildContext context,
//                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
//                    Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
