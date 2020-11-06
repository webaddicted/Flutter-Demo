import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';

class LoginWelcomePage2 extends StatefulWidget {
  @override
  _LoginWelcomePage2State createState() => _LoginWelcomePage2State();
}

class _LoginWelcomePage2State extends State<LoginWelcomePage2> {
  final String backImg = AssetsConst.BG_IMG;
  bool formVisible;
  @override
  void initState() {
    super.initState();
    formVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(backImg), fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.all(48.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 48.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 1.0,
                    sigmaY: 1.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.restaurant_menu,
                        size: 64,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Good Food",
                        style: TextStyle(
                            color: Colors.deepOrange.shade700,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                          "Nutritionally balanced, easy to cook recipes. Quality fresh local ingredients.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0)),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 0,
                          highlightElevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text("Create Account"),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Already have account? "),
                        WidgetSpan(
                            child: InkWell(
                              onTap: () {
                                print("Login tapped");
                              },
                              child: Text("Log in",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ))
                      ])),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
