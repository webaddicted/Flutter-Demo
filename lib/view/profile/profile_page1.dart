import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/view/widgets/nav_drawer_curve_widget.dart';
class ProfilePage1 extends StatefulWidget {
  @override
  _ProfilePage1State createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = ApiConstant.WEBADDICTED_IMG;

    return new Stack(children: <Widget>[
      new Container(color: Colors.blue,),
      new Image.network(imgUrl, fit: BoxFit.fill,),
      new BackdropFilter(
          filter: new ui.ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child: new Container(
            decoration: BoxDecoration(
              color:  Colors.blue.withOpacity(0.9),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),)),
      new Scaffold(
          appBar: new AppBar(
            title: new Text(StringConst.WEBADDICTED),
            centerTitle: false,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          drawer: NavDrawerCurveWidgt(),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                new SizedBox(height: _height/25.0,),
                new Text(StringConst.DEEPAK_SHARMA, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                new Padding(padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child:new Text('Snowboarder, Superhero and writer.\nSometime I work at google as Executive Chairman ',
                    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                new Divider(height: _height/30,color: Colors.white,),
                new Row(
                  children: <Widget>[
                    rowCell(343, 'POSTS'),
                    rowCell(673826, 'FOLLOWERS'),
                    rowCell(275, 'FOLLOWING'),
                  ],),
                new Divider(height: _height/30,color: Colors.white),
                new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){},
                  child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                    new Icon(Icons.person),
                    new SizedBox(width: _width/30,),
                    new Text('FOLLOW')
                  ],)),color: Colors.blue[50],),),
              ],
            ),
          )
      )
    ],);
  }

  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.white),),
    new Text(type,style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}