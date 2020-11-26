import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class BlurEffectPage extends StatefulWidget {
  @override
  _BlurEffectPageState createState() => _BlurEffectPageState();
}

class _BlurEffectPageState extends State<BlurEffectPage> {
  List<String> items;

  @override
  void initState() {
    super.initState();
    items = dummyLargeImg;
  }

  @override
  Widget build(BuildContext context) {
      List list = [
        'Introduction',
        'Early life',
        'Non-Film work',
        '2012-present',
        'Controversy'
      ];
      return new Container(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              AssetsConst.BABY_IMG,
              fit: BoxFit.fitHeight,
            ),
            Scaffold(
              appBar: new AppBar(
                title: new Text('Title'),
                elevation: 0.0,
                backgroundColor: const Color(0xFFB4C56C).withOpacity(0.5),
              ),
              backgroundColor: Colors.transparent,
              body: new Center(
                child: new Center(
                  child: new BackdropFilter(
                    filter: new ui.ImageFilter.blur(
                      sigmaX: 6.0,
                      sigmaY: 6.0,
                    ),
                    child: new Container(
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB4C56C).withOpacity(0.01),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: new Container(
                        child: ListView.builder(
                          itemBuilder: (contex, index) {
                            return index == 0
                                ? new Container(
                                    height: 50.0,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 12.0),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFB4C56C)
                                            .withOpacity(0.7),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                        boxShadow: [
                                          new BoxShadow(
                                              color: Colors.black12,
                                              offset: new Offset(2.0, 2.0),
                                              blurRadius: 2.0)
                                        ]),
                                    child: new Row(
                                      children: <Widget>[
                                        new Icon(
                                          Icons.info,
                                          color: Colors.white,
                                        ),
                                        new SizedBox(width: 8.0),
                                        new Text(list[index],
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 18.0))
                                      ],
                                    ),
                                  )
                                : new ListTile(
                                    title: new Text(
                                      list[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    leading: new Text('${index}',
                                        style: TextStyle(
                                            color: const Color(0xFFB4C56C),
                                            fontSize: 18.0)),
                                  );
                          },
                          itemCount: list.length,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
