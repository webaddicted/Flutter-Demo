import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

/**
 * Author : Deepak Sharma(Webaddicted)
 * Email : deepaksharmatheboss@gmail.com
 * Profile : https://github.com/webaddicted
 */
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
          Image.asset(AssetsConst.BG_FAMILY_IMG),
          Container(color: Colors.black.withOpacity(0.6)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loadLocalCircleImg(AssetsConst.DEEPAK_IMG, _iconAnim.value * 100),
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
                        padding: EdgeInsets.only(left: 30, right: 30),
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
                              padding: EdgeInsets.only(
                                  left: 50, right: 50, top: 12, bottom: 12),
                              shape: StadiumBorder(
                                side: BorderSide(
                                    color: Colors.transparent, width: 1),
                              ),
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
