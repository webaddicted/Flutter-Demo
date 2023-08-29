import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/example/calculator_app.dart';

class NavDrawerScreen extends StatefulWidget {
  @override
  _NavDrawerScreenState createState() => _NavDrawerScreenState();
}

class _NavDrawerScreenState extends State<NavDrawerScreen> {
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:getAppBar(title:StringConst.NAVIGATION_DRAWER_TITLE),
      drawer: Drawer(
        child: _drawerView(),
      ),
      body: _createUi(context),
    );
  }

  Widget _drawerView() {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50)),
            loadCircleImg(
                "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg",
                0,
                140),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text(
              "Deepak Sharma",
              style: TextStyle(
                  color: ColorConst.appColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 30)),
                _getDrawerItem("Home"),
                getDivider(),
                _getDrawerItem("Cart"),
                getDivider(),
                _getDrawerItem("Profile"),
                getDivider(),
                _getDrawerItem("Contact us"),
                getDivider(),
                _getDrawerItem("About us"),
                getDivider(),
                _getDrawerItem("exit"),
                getDivider(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return Container();
  }

  Widget _getDrawerItem(String title) {
    return GestureDetector(
      onTap: () {
        _navigateOnNextScreen(title);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 17.0, bottom: 17.0, left: 10.0, right: 3.0),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateOnNextScreen(String title) {
//    switch(title){
//      case "Home":
    Navigator.of(context).pop();
    navigationPush(context, CalculatorApp());
//        break;
//    }
  }
}
