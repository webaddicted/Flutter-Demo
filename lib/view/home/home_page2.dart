import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    list = dummyLargeImg;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Hero(
            tag: '110135',
            child: CustomPaint(
              size: Size(_width, _height),
              painter: Background(),
            )),
        Hero(
            tag: '110136',
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                AssetsConst.LOGO_IMG,
                scale: 4.0,
                color: const Color(0xFF222D57).withOpacity(0.4),
              ),
            )),
        Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text(StringConst.WEBADDICTED),
              centerTitle: false,
              elevation: 0.0,
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Travel the worls',
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        'See the world\'s best places',
                        style: TextStyle(
                            fontSize: 10.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: _height / 7),
                        child: Container(
                          height: 250.0,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              // dataObject data = list[index];
                              return InkWell(
                                onTap: () {},
                                child: Hero(
                                    tag: '110135$index',
                                    child: Container(
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
                                          BoxShadow(
                                              color:
                                                  Colors.black.withAlpha(70),
                                              offset: const Offset(3.0, 6.0),
                                              blurRadius: 5.0)
                                        ],
                                      ),
                                      margin: const EdgeInsets.only(left: 20.0),
                                      child: Stack(
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0, bottom: 20.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      'Index $index',
                                                      style: const TextStyle(
                                                          fontSize: 20.0,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                    ),
                                                    Text(
                                                      'Subtitle $index',
                                                      style: const TextStyle(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    //your elements here

                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Upcomming events',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'See recent events',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 16.0,
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: 100.0,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          // dataObject data = list[index];

                          return Container(
                            width: 250.0,
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xFFF0F1F6).withOpacity(0.9),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0))),
                            margin: const EdgeInsets.only(left: 10.0),
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                  list[index],
                                  width: 72.0,
                                  height: 72.0,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 14.0,
                                      ),
                                      Text(
                                        'Item $index',
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Description about this place item $index',
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: list.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    )
                  ],
                )
              ],
            ))
      ],
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
    var path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - pathLineToHeight);

    var endPoint = Offset(0.0, size.height - endPointHeight);
    var controlPoint =
        Offset(size.width / 4, size.height - controlPointHeight);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();

    canvas.drawPath(
      path,
      Paint()..color = Colors.white.withOpacity(opacity),
    );
  }

  _getSkyColors() {
    DateTime now = DateTime.now();
    int timeAsMins = now.hour * 60 + now.minute;
    var lerpValue =
        (timeAsMins <= 720) ? timeAsMins / 720 : (2 - timeAsMins / 720);
    var topSkyColor =
        Color.lerp(Colors.indigo.shade700, Colors.green, lerpValue);
    var bottomSkyColor = Color.lerp(
            Colors.indigo.shade100, Colors.lightBlueAccent.shade100, lerpValue)
        !.withOpacity(0.8);
    return [topSkyColor, bottomSkyColor];
  }

  _drawSky(Canvas canvas, Size size) {
    var skyGradient = LinearGradient(
      colors: _getSkyColors(),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    canvas.drawRect(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      Paint()
        ..shader = skyGradient.createShader(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
