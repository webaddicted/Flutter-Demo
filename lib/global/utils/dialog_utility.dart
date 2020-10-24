import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

showAlertDialog({BuildContext ctx, String title, String msg}) => showDialog(
    context: ctx,
    child: new AlertDialog(
      title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
      content: getTxt(msg: msg),
    ));

showSingleClickDialog(
        {BuildContext ctx, String title, String msg, Function okClick}) =>
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
            content: getTxt(msg: msg),
            actions: [FlatButton(child: Text("OK"), onPressed: okClick)]);
      },
    );

showTwoClickDialog(
        {BuildContext ctx,
        String title,
        String msg,
        Function okClick,
        Function cancelClick}) =>
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
            content: getTxt(msg: msg),
            actions: [
              FlatButton(child: getTxt(msg: 'OK'), onPressed: okClick),
              FlatButton(child: getTxt(msg: 'Cancel'), onPressed: cancelClick),
            ]);
      },
    );

showCustomDialog({BuildContext ctx, Widget dialogUi}) => showDialog(
    context: ctx,
    builder: (BuildContext ctx) {
      return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: dialogUi);
    });
