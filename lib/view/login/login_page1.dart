import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted
class LoginPage1 extends StatefulWidget {
  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimController;
  late Animation<double> _iconAnim;

  @override
  void initState() {
    super.initState();
    _iconAnimController = AnimationController(
      duration: const Duration(microseconds: 500),
      vsync: this,
    );
    _iconAnim =
        CurvedAnimation(parent: _iconAnimController, curve: Curves.easeOut);
    _iconAnim.addListener(() => setState(() {}));
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
                          primaryColor: ColorConst.WHITE_COLOR,
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: ColorConst.WHITE_COLOR,
                                  fontSize: 15)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorConst.WHITE_COLOR)),
                      child: Container(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              decoration:
                                  const InputDecoration(labelText: "mobile number"),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              maxLength: 40,
                              decoration:
                                  const InputDecoration(labelText: "Password"),
                              obscureText: true,
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            MaterialButton(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 50, top: 12, bottom: 12),
                              shape: const StadiumBorder(
                                side: BorderSide(
                                    color: Colors.transparent, width: 1),
                              ),
                              color: ColorConst.APP_COLOR,
                              onPressed: () => {},
                              textColor: ColorConst.WHITE_COLOR,
                              splashColor: ColorConst.WHITE_COLOR,
                              child: const Text("Login"),
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
