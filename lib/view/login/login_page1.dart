import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimController;
  Animation<double> _iconAnim;

  @override
  void initState() {
    super.initState();
    _iconAnimController = AnimationController(
      duration: Duration(microseconds: 500),
      vsync: this,
    );
    _iconAnim =
        CurvedAnimation(parent: _iconAnimController, curve: Curves.easeOut);
    _iconAnim.addListener(() => this.setState(() {}));
    _iconAnimController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.BLACK_COLOR,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          loadImg(
              'https://www.wallpapertip.com/wmimgs/94-941374_asian-girl-wallpaper.jpg',
              0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnim.value * 100,
              ),
              Form(
                  child: Theme(
                      data: ThemeData(
                          brightness: Brightness.dark,
                          primaryColor: ColorConst.WHITE_COLOR,
                          accentColor: ColorConst.WHITE_COLOR,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: ColorConst.WHITE_COLOR,
                                  fontSize: 15))),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              decoration:
                                  InputDecoration(labelText: "mobile number"),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              maxLength: 40,
                              decoration:
                                  InputDecoration(labelText: "Password"),
                              obscureText: true,
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            MaterialButton(
                              color: ColorConst.APP_COLOR,
                              onPressed: () => {},
                              textColor: ColorConst.WHITE_COLOR,
                              child: Text("Login"),
                              splashColor: ColorConst.WHITE_COLOR,
                            )
                          ],
                        ),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
