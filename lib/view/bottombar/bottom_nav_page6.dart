import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/MenuTabBar.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomNavPage6 extends StatefulWidget {
  @override
  _BottomNavPage6State createState() => _BottomNavPage6State();
}

class _BottomNavPage6State extends State<BottomNavPage6> {
  BuildContext ctx;
  int _currentTabIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_NAVIGATION_TITLE),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return SafeArea(
        child: new Stack(children: <Widget>[
      new Center(
          child: new Text("View",
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
      new MenuTabBar(
        background: Colors.blue,
        iconButtons: [
          new IconButton(
              color: Colors.blue,
              icon: new Icon(Icons.home, size: 30),
              onPressed: () {}),
          new IconButton(
              color: Colors.blue,
              icon: new Icon(Icons.search, size: 30),
              onPressed: () {}),
          new IconButton(
              color: Colors.blue,
              icon: new Icon(Icons.map, size: 30),
              onPressed: () {}),
          new IconButton(
              color: Colors.blue,
              icon: new Icon(Icons.favorite, size: 30),
              onPressed: () {}),
        ],
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  child: new Text("Reminder",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  margin: EdgeInsets.all(10)),
              new Container(
                  child: new Text("Camera",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  margin: EdgeInsets.all(10)),
              new Container(
                  child: new Text("Attchment",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  margin: EdgeInsets.all(10)),
              new Container(
                  child: new Text("Text Note",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  margin: EdgeInsets.all(10))
            ]),
      )
    ]));
  }
}
