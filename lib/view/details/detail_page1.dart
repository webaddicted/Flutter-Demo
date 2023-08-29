// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class DetailPage1 extends StatefulWidget {
  @override
  _DetailPage1State createState() => _DetailPage1State();
}

class _DetailPage1State extends State<DetailPage1> {
  List<String>? items;

  @override
  void initState() {
    super.initState();
    items = dummyLargeImg;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final headerList = ListView.builder(
      shrinkWrap: true,
      physics:  const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        return Padding(
          padding: padding,
          child: InkWell(
            onTap: () {
              printLog(msg: 'Card selected');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: ColorConst.greyShimmer,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                //TODO UNDO
                // image: new DecorationImage(
                //   image: CachedNetworkImageProvider(items[index]),
                //   fit: BoxFit.fill,
                // ),
              ),
//                                    height: 200.0,
              width: 200.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Item index $index',
                              style: const TextStyle(color: Colors.white),
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
      itemCount: items!.length,
    );

    final body = Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.WEBADDICTED),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Recent Items',
                            style: TextStyle(color: Colors.white70),
                          )),
                    ),
                     Container(
                          height: 300.0, width: _width, child: headerList),

                    ListView.builder(
                          shrinkWrap: true,
                            physics:  const ClampingScrollPhysics(),
                            itemCount: items!.length,
                            itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 72.0,
                                  width: 72.0,
                                  decoration: BoxDecoration(
                                      color: ColorConst.greyShimmer,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(70),
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 2.0)
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12.0)),
                                    //TODO UNDO
                                    // image: new DecorationImage(
                                      //   image: new CachedNetworkImageProvider(items[index]),
                                      //   fit: BoxFit.cover,
                                      // )
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                const Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'My item header',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Item Subheader goes here\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                )),
                                const Icon(
                                  Icons.shopping_cart,
                                  color: const Color(0xFF273A48),
                                )
                              ],
                            ),
                            const Divider(),
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

    return Container(
      decoration: const BoxDecoration(
        color: const Color(0xFF273A48),
      ),
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(_width, _height),
            painter: Background(),
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
    var path = Path();
    path.addPolygon([
      Offset(size.width, size.height / 5),
      Offset(size.width, size.height),
      Offset(0.0, size.height),
      Offset(0.0, size.height / 2.5),
    ], true);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
