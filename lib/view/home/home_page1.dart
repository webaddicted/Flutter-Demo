
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  List<String> list = new List();
@override
  void initState() {
    super.initState();
    list = dummyLargeData;
  }
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Hero(
              tag: '110135',
              child: new CustomPaint(
                size: new Size(_width, _height),
                painter: new Background(),
              )),
          new Hero(
              tag: '110136',
              child: new Align(
                alignment: Alignment.bottomRight,
                child: new Image.asset(
                  'assets/tree.png',
                  scale: 4.0,
                  color: const Color(0xFF222D57).withOpacity(0.4),
                ),
              )),
          new Scaffold(
              appBar: new AppBar(
                backgroundColor: Colors.transparent,
                title: new Text(StringConst.WEBADDICTED),
                centerTitle: false,
                elevation: 0.0,
              ),
              backgroundColor: Colors.transparent,
              body: new Stack(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(left: 20.0, top: 50.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          'Travel the worls',
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white),
                        ),
                        new Text(
                          'See the world\'s best places',
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(top: _height / 7),
                          child: new Container(
                            height: 250.0,
                            child: new ListView.builder(
                              itemBuilder: (context, index) {
                                // dataObject data = list[index];
                                return new InkWell(
                                  onTap: () {
                                  },
                                  child: new Hero(
                                      tag: '110135$index',
                                      child: new Container(
//                                  height: 180.0,
                                        width: _width / 1.8,
                                        decoration: BoxDecoration(
                                          color: Colors.black45,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              list[index],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: [
                                            new BoxShadow(
                                                color:
                                                Colors.black.withAlpha(70),
                                                offset: const Offset(3.0, 6.0),
                                                blurRadius: 5.0)
                                          ],
                                        ),
                                        margin: new EdgeInsets.only(left: 20.0),
                                        child: new Stack(
                                          children: <Widget>[
                                            new Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                  padding: new EdgeInsets.only(
                                                      left: 20.0, bottom: 20.0),
                                                  child: new Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      new Text(
                                                        'Index $index',
                                                        style: new TextStyle(
                                                            fontSize: 20.0,
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                      new Text(
                                                        'Subtitle $index',
                                                        style: new TextStyle(
                                                            fontSize: 10.0,
                                                            color: Colors.white,
                                                            fontWeight:
                                                            FontWeight
                                                                .normal),
                                                      ),
                                                    ],
                                                  )),
                                            )
                                          ],
                                        ),
                                      )),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: list.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      //your elements here

                      new Padding(
                        padding: new EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Upcomming events',
                              style: new TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              'See recent events',
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            new SizedBox(
                              height: 16.0,
                            )
                          ],
                        ),
                      ),

                      new Container(
                        height: 100.0,
                        child: new ListView.builder(
                          itemBuilder: (context, index) {
                            // dataObject data = list[index];

                            return new Container(
                              width: 250.0,
                              decoration: new BoxDecoration(
                                  color:
                                  const Color(0xFFF0F1F6).withOpacity(0.9),
                                  borderRadius: BorderRadius
                                      .all(new Radius.circular(5.0))),
                              margin: new EdgeInsets.only(left: 10.0),
                              padding:
                              new EdgeInsets.only(left: 16.0, right: 16.0),
                              child: new Row(
                                children: <Widget>[
                                  new Image.network(
                                    list[index],
                                    width: 72.0,
                                    height: 72.0,
                                    fit: BoxFit.cover,
                                  ),
                                  new SizedBox(
                                    width: 4.0,
                                  ),
                                  new Expanded(
                                    child: new Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new SizedBox(
                                          height: 14.0,
                                        ),
                                        new Text(
                                          'Item $index',
                                          style: new TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        new Text(
                                          'Description about this place item $index',
                                          style: new TextStyle(
                                              fontSize: 10.0,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                    flex: 1,
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: list.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      new SizedBox(
                        height: 16.0,
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    _drawSky(canvas, size);
    _drawArc(canvas, size, 0.0, 30.0, 50.0, 1.0);
    _drawArc(canvas, size, 50.0, 145.0, 145.0, 0.35);
    _drawArc(canvas, size, 145.0, 80.0, 145.0, 0.35);
    _drawArc(canvas, size, 80.0, 50.0, 95.0, 0.35);
    _drawArc(canvas, size, 200.0, 350.0, 95.0, 0.30);
    _drawArc(canvas, size, size.height / 3, 8 * size.height / 10, 295.0, 0.20);
  }

  _drawArc(Canvas canvas, Size size, double pathLineToHeight,
      double endPointHeight, double controlPointHeight, double opacity) {
    var path = new Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - pathLineToHeight);

    var endPoint = new Offset(0.0, size.height - endPointHeight);
    var controlPoint =
    new Offset(size.width / 4, size.height - controlPointHeight);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();

    canvas.drawPath(
      path,
      new Paint()..color = Colors.white.withOpacity(opacity),
    );
  }

  _getSkyColors() {
    DateTime now = new DateTime.now();
    int timeAsMins = now.hour * 60 + now.minute;
    var lerpValue =
    (timeAsMins <= 720) ? timeAsMins / 720 : (2 - timeAsMins / 720);
    var topSkyColor =
    Color.lerp(Colors.indigo.shade700, Colors.green, lerpValue);
    var bottomSkyColor = Color
        .lerp(
        Colors.indigo.shade100, Colors.lightBlueAccent.shade100, lerpValue)
        .withOpacity(0.8);
    return [topSkyColor, bottomSkyColor];
  }

  _drawSky(Canvas canvas, Size size) {
    var skyGradient = new LinearGradient(
      colors: _getSkyColors(),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    canvas.drawRect(
      new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      new Paint()
        ..shader = skyGradient.createShader(
          new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}