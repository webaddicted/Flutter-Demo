import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/sqflite/sqflite_signup.dart';
import 'package:flutterbeginner/view/sqflite/sqlite_home.dart';
import 'dart:math' as math;

class LoginPage5 extends StatefulWidget {
  @override
  _LoginPage5State createState() => _LoginPage5State();
}

class _LoginPage5State extends State<LoginPage5> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.removeListener(_printLatestValue);
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final input = new TextField(
      textAlign: TextAlign.center,
      decoration: new InputDecoration.collapsed(
        hintText: "The hint text",
      ),
      obscureText: false,
    );

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.yellow[800], Colors.red],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              tileMode: TileMode.clamp,
            )),
          ),
          new CustomPaint(
            painter: new Background(),
            size: Size(width, height),
          ),
          new Scaffold(
            appBar: new AppBar(
              title: new Text(StringConst.WEBADDICTED),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.topCenter,
                    child: new Text(
                      'GUFRA',
                      style: TextStyle(
                          fontSize: height / 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.7)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 5, left: width / 20, right: width / 20),
                    child: new Container(
                      height: 4 * height / 10,
                      width: 9 * width / 10,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(1.0),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black54.withOpacity(0.5),
                                blurRadius: 2.0,
                                offset: Offset(2.0, 2.0)),
                          ],
                          borderRadius:
                              BorderRadius.all(new Radius.circular(10.0))),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new SizedBox(
                            height: width / 6,
                          ),
                          new SHTextField(
                            controller: myController,
                            hintText: 'Username',
                            icon: Icons.account_circle,
                          ),
                          new SHTextField(
                            controller: myController,
                            hintText: 'Password',
                            obscure: true,
                            icon: Icons.security,
                          ),
                          new SizedBox(
                            height: width / 12,
                          ),
                          new InkWell(
                            child: Container(
                              child: new Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: height / 50,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              width: width / 1.5,
                              height: height / 18,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: width / 10, right: width / 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(height / 9)),
                                  gradient: LinearGradient(
                                      colors: [Colors.red, Colors.yellow[700]],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      tileMode: TileMode.clamp)),
                            ),
                          ),
                          SizedBox(
                            height: height / 16,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'You don\'t have an account?',
                                  style: TextStyle(fontSize: height / 70),
                                ),
                                FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: height / 60,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height / 5 - width / 8,
                        left: width / 2 - width / 8),
                    child: new HexagoneLogo(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HexagoneLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new CustomPaint(
          painter: new _HexagoneLogo(),
          size: new Size(width / 4, width / 4),
        ),
        new CustomPaint(
          painter: new _HexagoneLogo(),
          size: new Size(width / 6, width / 6),
        ),
        new CustomPaint(
          painter: new _HexagoneLogo(),
          size: new Size(width / 12, width / 12),
        )
      ],
    );
  }
}

class _HexagoneLogo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = new Offset(0.0, 0.0) & new Size(size.width, size.height);
    var paint = new Paint();
    paint
      ..color = Colors.orange
      ..strokeWidth = 2.0
      ..shader = new LinearGradient(
              colors: [Colors.red, Colors.yellow],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              tileMode: TileMode.clamp)
          .createShader(rect)
      ..style = PaintingStyle.fill;
    var path = new Path();
    path.moveTo(1 * size.width / 2, 0 * size.height / 4); //.
    path.lineTo(2 * size.width / 2, 1 * size.height / 4); // \
    path.lineTo(2 * size.width / 2, 3 * size.height / 4); // \
    path.lineTo(1 * size.width / 2, 4 * size.height / 4); // \
    path.lineTo(0 * size.width / 2, 3 * size.height / 4); // \
    path.lineTo(0 * size.width / 2, 1 * size.height / 4); // \
    path.lineTo(1 * size.width / 2, 0 * size.height / 4); // \

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class SHBackground extends StatefulWidget {
  @override
  _Animbg createState() => new _Animbg();
}

class _Animbg extends State<SHBackground> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  buildCircle(double delay) {
    return new ScaleTransition(
      scale: new DelayTween(begin: 0.85, end: 1.5, delay: delay)
          .animate(_controller),
      child: new Container(
        height: 10.0,
        width: 10.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Center(
      child: new Container(
        width: 80.0,
        height: 80.0,
        color: Colors.lightGreen,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildCircle(.0),
            buildCircle(.2),
            buildCircle(.4),
//            buildCircle(.6),
//            buildCircle(.8),
          ],
        ),
      ),
    );
  }
}

class DelayTween extends Tween<double> {
  final double delay;

  DelayTween({
    double begin,
    double end,
    this.delay,
  }) : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    double value = (math.sin((t - delay) * 2 * math.pi) + 1) / 2;
    return super.lerp(value);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class BgPainter extends CustomPainter {
  double value;

  BgPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    _drawCircle(canvas, size, 0.0);
    _drawCircle(canvas, size, size.width / 8 - size.width / 4);
  }

  _drawCircle(Canvas canvas, Size size, double radius) {
    radius = radius + value * size.width / 4;
    if (radius > size.width / 2) radius = 0.0;
    double opacity = (1.0 - radius / size.width / 2) < 0
        ? 0.0
        : (1.0 - radius / size.width / 2);
    opacity = opacity > 1.0 ? 1.0 : opacity;

    canvas.drawCircle(new Offset(size.width / 2, size.height / 2), (radius),
        new Paint()..color = Colors.red.withOpacity(opacity));
  }

  _drawPath(Canvas canvas, Size size) {
    Paint p = new Paint();
    p..color = Colors.red;
    p..strokeWidth = 2.0;

    var path = new Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 10);
//    path.addRect(new Rect.fromPoints(Offset(0.0, size.height-1), Offset(size.width, size.height)));

    var endPoint = new Offset(size.width * value, size.height);

    var controlPoint = new Offset(size.width * value, size.height * 0);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    var endPoint1 = new Offset(size.width - value * size.width, size.height);

    var controlPoint1 =
        new Offset(size.width - size.width * value * 0, size.height * value);

//    path.quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);

    path.close();
    canvas.drawPath(path, new Paint()..color = Colors.lightGreen);

    canvas.drawLine(endPoint, controlPoint, p);
    canvas.drawLine(endPoint1, controlPoint1, p);
  }

  @override
  bool shouldRepaint(BgPainter oldDelegate) => oldDelegate.value != value;
}

class SHTextField extends StatelessWidget {
  SHTextField(
      {this.controller, this.hintText, this.obscure = false, this.icon});

  TextEditingController controller;
  String hintText;
  bool obscure;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return new Container(
      child: new Row(
        children: <Widget>[
          new Icon(
            icon,
            color: Colors.yellow[900],
          ),
          new SizedBox(
            width: width / 30,
          ),
          new Expanded(
              child: new TextField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
            ),
          )),
        ],
      ),
      padding: EdgeInsets.only(
        bottom: 4.0,
      ),
      margin: EdgeInsets.only(
          top: height / 40, right: width / 20, left: width / 20),
      decoration: BoxDecoration(
          border: new Border(bottom: BorderSide(color: Colors.yellow[900]))),
    );
  }
}

class Background extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var rect = new Offset(0.0, 0.0)&new Size(size.width, size.height);
    var paint = new Paint();
    paint..color = Colors.orange
      ..strokeWidth = 2.0
      ..shader = new LinearGradient(colors: [Colors.red.withOpacity(0.5), Colors.yellow[800].withOpacity(0.5)],
          begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
          TileMode.clamp).createShader(rect)
      ..style = PaintingStyle.fill;

    var path = new Path();
    path.moveTo(size.width*0, size.height);
    path.lineTo(size.width, size.height);
    var endPoint = new Offset(0*size.width/4, 4*size.height/4);
    var ctlPoint = new Offset(0.2*size.width/4, 3*size.height/4);
    path.quadraticBezierTo(ctlPoint.dx, ctlPoint.dy, endPoint.dx, endPoint.dy);


    paint..shader = new LinearGradient(colors: [Colors.yellow.withOpacity(1.0), Colors.red.withOpacity(1.0)],
        begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
        TileMode.clamp).createShader(rect);
    var path1 = new Path();
    path1.moveTo(size.width*1, size.height);
    path1.lineTo(size.width*0, size.height);

    var endPoint1 = new Offset(5*size.width/4, 4*size.height/4);
    var ctlPoint1 = new Offset(4.5*size.width/4, 2.5*size.height/4);
    path1.quadraticBezierTo(ctlPoint1.dx, ctlPoint1.dy, endPoint1.dx, endPoint1.dy);

    canvas.drawPath(path1, paint);
    paint..shader = new LinearGradient(colors: [Colors.red.withOpacity(0.2), Colors.yellow[800].withOpacity(0.3)],
        begin: Alignment.topRight, end: Alignment.bottomLeft, tileMode:
        TileMode.clamp).createShader(rect);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}
