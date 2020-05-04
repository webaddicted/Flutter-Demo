import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

showAlertDialog(BuildContext context, String title, String msg) => showDialog(
    context: context,
    child: new AlertDialog(
      title: getTxtBlackColor(title, null, FontWeight.bold),
      content: getTxt(msg, null),
    ));

showSingleClickDialog(
        BuildContext context, String title, String msg, Function okClick) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: getTxtBlackColor(title, null, FontWeight.bold),
            content: getTxt(msg, null),
            actions: [FlatButton(child: Text("OK"), onPressed: okClick)]);
      },
    );

showTwoClickDialog(BuildContext context, String title, String msg,
        Function okClick, Function cancelClick) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: getTxtBlackColor(title, null, FontWeight.bold),
            content: getTxt(msg, null),
            actions: [
              FlatButton(child: Text("OK"), onPressed: okClick),
              FlatButton(child: Text("Cancel"), onPressed: cancelClick),
            ]);
      },
    );

showCustomDialog(
        BuildContext context, String title, String msg, Function okClick) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getTxtBlackColor(title, 18, FontWeight.bold),
                      SizedBox(height: 10),
                      getTxt(msg, null),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 320.0,
                        child: RaisedButton(
                          onPressed: okClick,
                          child: getTxtWhiteColor('Save', 15, FontWeight.bold),
                          color: const Color(0xFF1BC0C5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
