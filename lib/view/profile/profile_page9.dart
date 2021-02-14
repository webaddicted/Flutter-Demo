import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ProfilePage9 extends StatefulWidget {
  @override
  _ProfilePage9State createState() => _ProfilePage9State();
}

class _ProfilePage9State extends State<ProfilePage9> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return new Scaffold(
        body: new Center(
      child: new Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          loadLocalCircleImg(ApiConstant.DEMO_IMG, 100),
          SizedBox(
            height: 10,
          ),
          getTxtBlackColor(
            msg: StringConst.HOME_TITLE,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTxtBlackColor(
            msg: 'deepaksharma@gmail.com',
            fontSize: 13,
          ),
          Divider(
            height: _height / 30,
            color: Colors.black,
          ),
          Row(
            children: <Widget>[
              rowCell(343, 'POSTS'),
              rowCell(673826, 'FOLLOWERS'),
              rowCell(275, 'FOLLOWING'),
            ],
          ),
          Divider(height: _height / 30, color: Colors.black),
          getTxtBlackColor(msg: "About", fontSize: 16, fontWeight: FontWeight.w600),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getTxtBlackColor(msg: StringConst.DUMMY_LAGE_TEXT),
          ),

        ],
      ),
    ));
  }

  Widget rowCell(int count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          Text(
            '$count',
            style: new TextStyle(color: Colors.black),
          ),
          Text(type,
              style: new TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal))
        ],
      ));
}
