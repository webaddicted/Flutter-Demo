
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';

class ProfilePage3 extends StatefulWidget {
  @override
  _ProfilePage3State createState() => _ProfilePage3State();
}

class _ProfilePage3State extends State<ProfilePage3> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [
              const Color(0xFF26CBE6),
              const Color(0xFF26CBC0),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          new Scaffold(
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.center,
                    child: new Padding(
                      padding: new EdgeInsets.only(top: _height / 15),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundImage:
                                new AssetImage(AssetsConst.DEEPAK_IMG),
                            radius: _height / 10,
                          ),
                          new SizedBox(
                            height: _height / 30,
                          ),
                          new Text(
                            StringConst.DEEPAK_SHARMA,
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: _height / 2.2),
                    child: new Container(
                      color: Colors.white,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 2.6,
                        left: _width / 20,
                        right: _width / 20),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 2.0,
                                    offset: new Offset(0.0, 2.0))
                              ]),
                          child: new Padding(
                            padding: new EdgeInsets.all(_width / 20),
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  headerChild('Photos', 114),
                                  headerChild('Followers', 1205),
                                  headerChild('Following', 360),
                                ]),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: _height / 20),
                          child: new Column(
                            children: <Widget>[
                              infoChild(
                                  _width, Icons.email, 'deepaksharma040695@gmail.com'),
                              infoChild(_width, Icons.call, '+91-1234567890'),
                              infoChild(
                                  _width, Icons.group_add, 'Add to group'),
                              infoChild(_width, Icons.chat_bubble,
                                  'Show all comments'),
                              new Padding(
                                padding: new EdgeInsets.only(top: _height / 30),
                                child: new Container(
                                  width: _width / 3,
                                  height: _height / 20,
                                  decoration: new BoxDecoration(
                                      color: const Color(0xFF26CBE6),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(_height / 40)),
                                      boxShadow: [
                                        new BoxShadow(
                                            color: Colors.black87,
                                            blurRadius: 2.0,
                                            offset: new Offset(0.0, 1.0))
                                      ]),
                                  child: new Center(
                                    child: new Text('FOLLOW ME',
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerChild(String header, int value) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            '$value',
            style: new TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: width / 10,
              ),
              new Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
              new SizedBox(
                width: width / 20,
              ),
              new Text(data)
            ],
          ),
          onTap: () {
            printLog(msg: 'Info Object selected');
          },
        ),
      );
}
