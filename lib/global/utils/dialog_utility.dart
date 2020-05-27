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
        BuildContext context, Widget dialogMatter) =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: dialogMatter
          );
        });
