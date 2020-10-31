import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class LoginPage6 extends StatefulWidget {
  @override
  _LoginPage6State createState() => _LoginPage6State();
}

class _LoginPage6State extends State<LoginPage6> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  TextEditingController pwdCont = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaint(
            painter: Background(),
            size: Size(size.width, size.height),
          ),
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 1.0),
                          child: Container(
                            child: Image.asset(
                              AssetsConst.LOGO_IMG,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        getTxtWhiteColor(
                          msg: StringConst.WEBADDICTED,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          edtEmailIdField(emailCont),
                          SizedBox(height: size.height / 60),
                          edtPwdField(pwdCont, passwordVisible, pwdVisClick),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: InkWell(
                        onTap: () {
                          final form = formKey.currentState;
                          if (formKey.currentState.validate()) {
                            form.save();
                            setState(() {});
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          margin: EdgeInsets.only(
                              right: size.width / 20,
                              left: size.width / 20,
                              top: size.height / 40),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              gradient: LinearGradient(
                                  colors: [Colors.pink, Colors.deepOrange],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.bottomLeft,
                                  tileMode: TileMode.clamp)),
                        )),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        'FORGOT PASSWORD?',
                        style: TextStyle(color: Colors.pink),
                      )),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: size.width / 20,
                            right: size.width / 20,
                            top: size.height / 80,
                            bottom: size.height / 100),
                        height: 0.8,
                        color: Colors.black38,
                      ),
                      Center(
                        child: Text(
                          ' Or login with ',
                          style: TextStyle(backgroundColor: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height / 40,
                        left: size.width / 20,
                        right: size.width / 20),
                    child: Row(
                      children: <Widget>[
                        socialButtons(AssetsConst.FB_IMG),
                        socialButtons(AssetsConst.GOOGLE_IMG),
                        socialButtons(AssetsConst.TWITTER_IMG),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height / 20,
                      ),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Don\'t have an account?'),
                            Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  pwdVisClick() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  Widget socialButtons(image) => Expanded(
          child: GestureDetector(
        child: Container(
          child: Image.asset('$image'),
          width: 50.0,
          height: 50.0,
        ),
        onTap: () {
          switch (image) {
            case AssetsConst.FB_IMG:
              {
                print('facebook selected');
              }
              break;

            case AssetsConst.GOOGLE_IMG:
              {
                print('google-plus selected');
              }
              break;

            case AssetsConst.TWITTER_IMG:
              {
                print('twitter selected');
              }
              break;

            default:
              {}
          }
        },
      ));
}

String validatePassword(String value) {
  print(value);
  if (value == null) return 'Invalid password';
  if (value.length < 6)
    return 'Invalid password';
  else
    return null;
}

String validateEmail(String value) {
  print(value);
  if (value == null) return 'Enter Valid Email';
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var rect = new Offset(0.0, 0.0) & new Size(size.width, size.height);
    var paint = new Paint();
    paint
      ..color = Colors.orange
      ..strokeWidth = 2.0
      ..shader = new LinearGradient(
              colors: [Colors.pink, Colors.redAccent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              tileMode: TileMode.clamp)
          .createShader(rect)
      ..style = PaintingStyle.fill;

    var firstControlPoint = Offset(size.width / 6, size.height / 4);
    var firstEndPoint = Offset(size.width / 2.5, size.height / 4 - 30.0);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height / 4 - 75);
    var secondEndPoint = Offset(size.width, size.height / 4 - 40);

    var path = new Path();
    path.lineTo(0.0, size.height / 4 - 20);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 4 - 40);
    path.lineTo(size.width, 0.0);
    canvas.drawPath(path, paint);

    var p1 = Offset(size.width / 4, size.height / 4 + 0);
    var p2 = Offset(size.width / 1.8, size.height / 4 + 10);

    var p3 = Offset(size.width - (size.width / 4), size.height / 4 + 20);
    var p4 = Offset(size.width, size.height / 4);

    var pathl = new Path();
    pathl.lineTo(0.0, size.height / 4 - 10);
    pathl.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    pathl.quadraticBezierTo(p3.dx, p3.dy, p4.dx, p4.dy);
    pathl.lineTo(size.width, size.height / 4 - 40);
    pathl.lineTo(size.width, 0.0);

    paint
      ..shader = new LinearGradient(
              colors: [Colors.pink.withOpacity(0.4), Colors.orangeAccent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              tileMode: TileMode.clamp)
          .createShader(rect);
    canvas.drawPath(pathl, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
