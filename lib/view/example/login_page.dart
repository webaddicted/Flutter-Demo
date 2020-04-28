import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimController;
  Animation<double> _iconAnim;

  @override
  void initState() {
    super.initState();
    _iconAnimController = new AnimationController(
      vsync: this,
      duration: new Duration(microseconds: 500),
    );
    _iconAnim =
        new CurvedAnimation(parent: _iconAnimController, curve: Curves.easeOut);
    _iconAnim.addListener(() => this.setState(() {}));
    _iconAnimController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: ColorConst.BLACK_COLOR,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage(AssetsConst.DOWNLOAD_IMG),
            fit: BoxFit.cover,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnim.value * 100,
              ),
              new Form(
                  child: new Theme(
                      data: new ThemeData(
                          brightness: Brightness.dark,
                          primaryColor: ColorConst.WHITE_COLOR,
                          accentColor: ColorConst.WHITE_COLOR,
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                  color: ColorConst.WHITE_COLOR,
                                  fontSize: 15))),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: new Column(
                          children: <Widget>[
                            new TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              decoration: new InputDecoration(
                                  labelText: "mobile number"),
                            ),
                            new TextFormField(
                              keyboardType: TextInputType.text,
                              maxLength: 40,
                              decoration:
                                  new InputDecoration(labelText: "Password"),
                              obscureText: true,
                            ),
                            new Padding(padding: EdgeInsets.only(top: 10)),
                            new MaterialButton(
                              color: ColorConst.APP_COLOR,
                              onPressed: () => {},
                              textColor: ColorConst.WHITE_COLOR,
                              child: new Text("Login"),
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
