import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class DetailPage1 extends StatefulWidget {
  @override
  _DetailPage1State createState() => _DetailPage1State();
}

class _DetailPage1State extends State<DetailPage1> {
  List<String> items;

  @override
  void initState() {
    super.initState();
    items = dummyLargeImg;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final headerList = new ListView.builder(
      shrinkWrap: true,
      physics:  ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {
              print('Card selected');
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: ColorConst.GREY_SHIMMER,
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: new DecorationImage(
                  image: CachedNetworkImageProvider(items[index]),
                  fit: BoxFit.fill,
                ),
              ),
//                                    height: 200.0,
              width: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: const Color(0xFF273A48),
                            borderRadius: new BorderRadius.only(
                                bottomLeft: new Radius.circular(10.0),
                                bottomRight: new Radius.circular(10.0))),
                        height: 30.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              'Item index $index',
                              style: new TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
    );

    final body = new Scaffold(
      appBar: new AppBar(
        title: new Text(StringConst.WEBADDICTED),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: new Container(
          child: new Stack(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: new Padding(
                          padding: new EdgeInsets.only(left: 8.0),
                          child: new Text(
                            'Recent Items',
                            style: new TextStyle(color: Colors.white70),
                          )),
                    ),
                     Container(
                          height: 300.0, width: _width, child: headerList),

                    ListView.builder(
                          shrinkWrap: true,
                            physics:  ClampingScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                      return new ListTile(
                        title: new Column(
                          children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  height: 72.0,
                                  width: 72.0,
                                  decoration: new BoxDecoration(
                                      color: ColorConst.GREY_SHIMMER,
                                      boxShadow: [
                                        new BoxShadow(
                                            color: Colors.black.withAlpha(70),
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 2.0)
                                      ],
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(12.0)),
                                      image: new DecorationImage(
                                        image: new CachedNetworkImageProvider(items[index]),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                new SizedBox(
                                  width: 8.0,
                                ),
                                new Expanded(
                                    child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'My item header',
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    new Text(
                                      'Item Subheader goes here\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                )),
                                new Icon(
                                  Icons.shopping_cart,
                                  color: const Color(0xFF273A48),
                                )
                              ],
                            ),
                            new Divider(),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return new Container(
      decoration: new BoxDecoration(
        color: const Color(0xFF273A48),
      ),
      child: new Stack(
        children: <Widget>[
          new CustomPaint(
            size: new Size(_width, _height),
            painter: new Background(),
          ),
          body,
        ],
      ),
    );
  }
}

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    _drawPentagone(canvas, size);
  }

  _drawPentagone(Canvas canvas, Size size) {
    var path = new Path();
    path.addPolygon([
      new Offset(size.width, size.height / 5),
      new Offset(size.width, size.height),
      new Offset(0.0, size.height),
      new Offset(0.0, size.height / 2.5),
    ], true);
    path.close();
    canvas.drawPath(path, new Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
