import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class BlurEffectPage extends StatefulWidget {
  @override
  _BlurEffectPageState createState() => _BlurEffectPageState();
}

class _BlurEffectPageState extends State<BlurEffectPage> {
  late List<String> items;

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
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            AssetsConst.BABY_IMG,
            fit: BoxFit.fitHeight,
          ),
          Scaffold(
            appBar: AppBar(
              title: Text('Title'),
              elevation: 0.0,
              backgroundColor: const Color(0xFFB4C56C).withOpacity(0.5),
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Center(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB4C56C).withOpacity(0.01),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (contex, index) {
                          return index == 0
                              ? Container(
                                  height: 50.0,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 12.0),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFB4C56C)
                                          .withOpacity(0.7),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 2.0)
                                      ]),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 8.0),
                                      Text(list[index],
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 18.0))
                                    ],
                                  ),
                                )
                              : ListTile(
                                  title: Text(
                                    list[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  leading: Text('$index',
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
      );
    }
  }
