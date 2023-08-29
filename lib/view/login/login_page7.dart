import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class LoginPage7 extends StatefulWidget {
  @override
  _LoginPage7State createState() => _LoginPage7State();
}

class _LoginPage7State extends State<LoginPage7> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.deepOrangeAccent, Colors.purple],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 100.0, 70.0));
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
        Container(
          color: Colors.white.withOpacity(0.8),
        ),
        ClipPath(
          clipper: ArcClipperBottom(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepOrangeAccent, Colors.purple],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft)),
          ),
        ),
        ClipPath(
          clipper: ArcClipperTop(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purple, Colors.deepOrangeAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.centerLeft)),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
//              Opacity(opacity: 0.1, child: Image.asset('assets/ic_launcher.png', height: size.width/5, width: size.width/5,),),
                SizedBox(height: 100),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Login',
                      style: new TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text('Don\'t have an account? '),
                          Text(
                            'Create your account',
                            style: TextStyle(color: Colors.deepOrange),
                          )
                        ],
                      )),
                ),
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
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      children: <Widget>[
                        Checkbox(
                            value: true,
                            checkColor: Colors.white,
                            activeColor: Colors.purple,
                            onChanged: (bool) {}),
                        Text('Remember me')
                      ],
                    )),
                    Text('Forgot Password ?')
                  ],
                ),
                MaterialButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 40.0, bottom: 20.0, right: 30.0, left: 30.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.deepOrangeAccent,
                                  Colors.purple
                                ],
                                begin: Alignment.bottomRight,
                                end: Alignment.centerLeft),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.deepPurple,
                                  blurRadius: 5.0,
                                  offset: Offset(5.0, 5.0)),
                            ]),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
                  child: Text('or login with'),
                ),
                Row(
                  children: <Widget>[
                    socialButtons(AssetsConst.fbImg),
                    socialButtons(AssetsConst.googleImg),
                    socialButtons(AssetsConst.twitterImg),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
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
            case AssetsConst.fbImg:
              {
                printLog(msg: 'facebook selected');
              }
              break;

            case AssetsConst.googleImg:
              {
                printLog(msg: 'google-plus selected');
              }
              break;

            case AssetsConst.twitterImg:
              {
                printLog(msg: 'twitter selected');
              }
              break;

            default:
              {}
          }
        },
      ));
}

class ArcClipperBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var width = size.width;
    var height = size.height;
    var path = Path();
    path.moveTo(0.0, height);
    path.lineTo(0, height);
    path.lineTo(width, height);

    var p1 = new Offset(width / 4, height);
    var p2 = new Offset(0 * width / 4, 3.5 * height / 4);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);

    var p3 = new Offset(2 * width / 4, 3.5 * height / 4);
    var p4 = new Offset(0 * width / 4, 3.5 * height / 4);
    path.quadraticBezierTo(p3.dx, p3.dy, p4.dx, p4.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ArcClipperTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var width = size.width;
    var height = size.height;
    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(0.0, 0.0);

    var p1 = new Offset(0.5 * width / 4, 1 * height / 4);
    var p2 = new Offset(5 * width / 4, 0 * height / 4);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
