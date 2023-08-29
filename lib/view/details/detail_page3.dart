import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage3 extends StatefulWidget {
  @override
  _DetailPage3State createState() => _DetailPage3State();
}

class _DetailPage3State extends State<DetailPage3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;
  late Color appBarColor;

  @override
  void initState() {
    appBarColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(0.5);
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2000)); //..repeat();
    CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: ElasticOutCurve());
    animation = Tween(begin: 0.0, end: 360.0).animate(curve);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        ClipPath(
            clipper: ArcClipper(),
            child: Container(
              color: ColorConst.fcmAppColor,
            )),
        Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.blueGrey[800],
                  ),
                  onPressed: () {})
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height / 30),
                    child: loadCircleImg(ApiConstant.DEMO_IMG, 0, (150 * animation.value / 360))
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: size.height / 20, left: 4, right: 4),
                    child: Container(
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Align(
                            alignment: Alignment.centerLeft,
                            child: FloatingActionButton(
                                onPressed: () {},
                                heroTag: 'left',
                                child: Icon(FontAwesomeIcons.heart, color: ColorConst.whiteColor,),
                                backgroundColor: Colors.black54,
                                elevation: 0.1),
                          )),
                          Expanded(
                              child: Align(
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                              onPressed: () {},
                              heroTag: 'right',
                              child: Icon(Icons.share_outlined, color: ColorConst.whiteColor),
                              backgroundColor: Colors.black54,
                              elevation: 0.1,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height / 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StringConst.WEBADDICTED,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text('60 rs/KG',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 14, left: 20, right: 20),
                          child: Text(
                            StringConst.DUMMY_LAGE_TEXT,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Nutritional Value',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          width: 100,
                          height: 100,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '258',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'calories',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          )),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[400],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        Row(
                          children: <Widget>[
                            description('0.3g', 'Fat', Colors.black),
                            description('25 g', 'Carbohydrate', Colors.black),
                            description('25.9 g', 'Protein', Colors.black),
                          ],
                        ),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 40, left: 30, right: 30, bottom: 30.0),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[400],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.deepPurple[400]!.withOpacity(0.5),
                                    offset: Offset(5, 5),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: Center(
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          onTap: () {
                            printLog(msg: 'Add to Cart Selected');
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SHDialog(
                                    height: 300, //size.height/3,
                                    title: Text(
                                      'How much you want',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        SHSlider(
                                          path: AssetsConst.babyImg,
                                          backgroundColor:
                                              ColorConst.fcmAppColor,
                                          min: 7,
                                          max: 10,
                                          divisions: 8,
                                          lineWidth: 10,
                                        ),
                                        InkWell(
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                'Confirm',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            height: 50,
                                            margin: EdgeInsets.only(
                                                top: 30,
                                                bottom: 30,
                                                left: 30,
                                                right: 30),
                                            decoration: BoxDecoration(
                                                color: Colors.deepPurple[400],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: ColorConst
                                                        .circleFade2
                                                        .withOpacity(0.5),
                                                    offset: Offset(5, 5),
                                                    blurRadius: 5,
                                                  )
                                                ]),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => FruitCart(fruit: widget.fruit,)));
                                          },
                                        )
                                      ],
                                    ),
                                    onOkButtonPressed: () {},
                                  );
                                });
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget description(value, desc, color) => Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: color, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '$desc',
            style: TextStyle(
                color: color, fontSize: 15, fontWeight: FontWeight.w200),
          ),
        ],
      ));
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0.0, size.height / 6);
    path.quadraticBezierTo(
        size.width / 2, size.height / 3, size.width, size.height / 6);
    path.lineTo(size.width, size.height / 6);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SHSlider extends StatefulWidget {
  final String? path;
  final int divisions;
  final double min, max;
  final String unit;
  final double fontSize;
  final double? padding;
  final double lineWidth;
  final Color backgroundColor;
  final Color color;
  final void Function(double value)? callback;

  SHSlider(
      {this.path,
      this.divisions = 10,
      this.min = 0,
      this.max = 100,
      this.unit = '',
      this.fontSize = 20,
      this.padding,
      this.lineWidth = 2,
      this.backgroundColor = Colors.blue,
      this.color = Colors.black,
      this.callback});

  @override
  _SHSliderState createState() => _SHSliderState();
}

class _SHSliderState extends State<SHSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset offset = const Offset(100, 100);
  late ui.Image image;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    initImage(widget.path);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> initImage(path) async {
    final ByteData data = await rootBundle.load(
      path,
    );
    image = await loadImage(Uint8List.view(data.buffer));
    printLog(msg: image.toString());
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img as Uint8List, (ui.Image img) {
      setState(() {
        printLog(msg: 'Image Loaded');
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 100,
      child: Stack(children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            painter: Pointer(
                offset: offset,
                image: image,
                divisions: widget.divisions,
                min: widget.min,
                max: widget.max,
                unit: widget.unit,
                fontSize: widget.fontSize,
                lineWidth: widget.lineWidth,
                backgroundColor: widget.backgroundColor,
                color: widget.color,
                callback: (value) {
//              print(value);
                  if (widget.callback != null) widget.callback!(value);
                }, padding: 2),
            size: Size(size.width, size.height),
          ),
        ),
        Container(
//        color: Colors.lightGreen.withOpacity(0.2),
          child: GestureDetector(
            onPanUpdate: (dragUpdate) {
              printLog(msg: dragUpdate.globalPosition);
              setState(() {
                offset = Offset(dragUpdate.localPosition.dx, offset.dy);
              });
            },
            onPanDown: (onPanDown) {
              printLog(msg: onPanDown.localPosition);
              setState(() {
                offset = Offset(onPanDown.localPosition.dx, offset.dy);
              });
            },
          ),
        )
      ]),
    );
  }
}

class Pointer extends CustomPainter {
  Offset offset;
  ui.Image image;
  int divisions;
  double min, max;
  String unit;
  double fontSize;
  double padding;
  double lineWidth;
  Color backgroundColor;
  Color color;
  final void Function(double value) callback;

  Pointer(
      {required this.offset,
      required this.image,
      required this.divisions,
      required this.min,
      required this.max,
      required this.unit,
      required this.padding,
      required this.fontSize,
      required this.color,
      required this.backgroundColor,
      required this.lineWidth,
      required this.callback});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    padding = this.padding ?? size.width / 6;
    double segment = (size.width - 2 * padding) / divisions;

    divisions = divisions ?? ((max - min) < 0 ? (max - min) * 10 : (max - min)) as int;
    double dx =
        (((offset.dx.floor() - padding / 2) ~/ segment).toInt()) * segment;
    dx = (dx > size.width - 2 * padding) ? (size.width - 2 * padding) : dx;
    dx = dx < padding / divisions ? 0 : dx;
    Offset reOffset = Offset(dx + padding, size.height / 2);

    double pox =
        min + (((reOffset.dx - padding) / segment) * ((max - min) / divisions));

    callback(pox);

    paint.strokeWidth = lineWidth;
    paint.color = backgroundColor;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(9.9 * padding / 10, size.height / 2),
        Offset(size.width - 9.9 * padding / 10, size.height / 2), paint);

    TextSpan spanMinLimit = TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 3 * fontSize / 4),
        text: '$min');
    TextPainter minTp = TextPainter(
      text: spanMinLimit,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    minTp.layout();

    minTp.paint(
        canvas,
        Offset(padding - (spanMinLimit.text!.length) * fontSize / 2,
            size.height / 2 - fontSize / 2));

    TextSpan spanMaxLimit = TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 3 * fontSize / 4),
        text: '$max');
    TextPainter maxTp = TextPainter(
        text: spanMaxLimit,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    maxTp.layout();

    maxTp.paint(canvas,
        Offset(size.width - padding + 6, size.height / 2 - fontSize / 2));

    for (int i = 0; i <= divisions; i++) {
      canvas.drawCircle(Offset(padding + i * segment, size.height / 2), 2,
          paint..color = color);
    }

    canvas.drawCircle(reOffset, 30, paint..color = backgroundColor);

    Path path = Path();
    path.moveTo(reOffset.dx, reOffset.dy - 35);
    path.lineTo(reOffset.dx - 5, reOffset.dy - 40);
    path.lineTo(reOffset.dx + 5, reOffset.dy - 40);
    path.close();
    canvas.drawPath(path, paint);
    canvas.drawShadow(path, Colors.grey, 2.0, true);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(reOffset.dx - 35, reOffset.dy - 80, 70, 40),
            Radius.circular(10.0)),
        paint..color = backgroundColor);

    TextSpan span = TextSpan(
        style: TextStyle(color: Colors.white, fontSize: fontSize),
        text: '${pox.toStringAsFixed(1)} $unit');
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(
        canvas,
        Offset(reOffset.dx - (span.text!.length / 2) * fontSize / 2,
            reOffset.dy - 60 - (0.5 * fontSize)));
    if (image != null) {
      paintImage(
          image,
          Rect.fromLTRB(reOffset.dx - 15, reOffset.dy - 15, reOffset.dx + 15,
              reOffset.dy + 15),
          canvas,
          paint,
          BoxFit.cover);
    }
  }

  void paintImage(
      ui.Image image, Rect outputRect, Canvas canvas, Paint paint, BoxFit fit) {
    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());
    final FittedSizes sizes = applyBoxFit(fit, imageSize, outputRect.size);
    final Rect inputSubRect =
        Alignment.center.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubRect =
        Alignment.center.inscribe(sizes.destination, outputRect);
    canvas.drawImageRect(image, inputSubRect, outputSubRect, paint);
  }

  @override
  bool shouldRepaint(Pointer oldDelegate) {
    return oldDelegate.offset != offset;
  }

  Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}

class SHDialog extends StatefulWidget {
  final Widget title;
  final double height;
  final Icon icon;
  final Widget child;
  final backgroundColor;
  final VoidCallback onOkButtonPressed;

  SHDialog({
    this.title = const Text('😃 I\'m title'),
    this.icon = const Icon(
      Icons.cancel,
      color: Colors.grey,
    ),
    this.child =
        const Text('Hello 😀\n Replace me with your widgets\n Thank You'),
    this.height = 0,
    this.backgroundColor = Colors.white,
    required this.onOkButtonPressed,
  });

  @override
  _SHDialogState createState() => _SHDialogState();
}

class _SHDialogState extends State<SHDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _height = 0;
  double _opacity = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        Size size = MediaQuery.of(context).size;
        _height = widget.height == 0 ? size.height / 3 : widget.height;
        _opacity = 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    opacity: _opacity,
                    duration: Duration(milliseconds: 800),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      curve: ElasticOutCurve(),
                      margin: EdgeInsets.only(left: 0.0, right: 0.0),
                      height: _height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(size.width / 16),
                              topLeft: Radius.circular(size.width / 16)),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.grey,
                                offset: Offset(4, 4),
                                blurRadius: 40)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: size.width / 20,
                              ),
                              Expanded(child: widget.title),
                              IconButton(
                                  icon: widget.icon,
                                  onPressed: () {
                                    setState(() {
                                      _height = _height / 2.5;
                                      _opacity = 0;
                                    });
                                    widget.onOkButtonPressed();
                                    Timer(Duration(milliseconds: 400), () {
                                      Navigator.of(context).pop();
                                      widget.onOkButtonPressed();
                                    });
                                  })
                            ],
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            child: widget.child,
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
