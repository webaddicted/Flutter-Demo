import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/customview/sticky/stick_widget.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class StickyHeaderPage1 extends StatefulWidget {
  @override
  _StickyHeaderPage1State createState() => _StickyHeaderPage1State();
}

class _StickyHeaderPage1State extends State<StickyHeaderPage1> {
  @override
  Widget build(_) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx: context, title: 'Stick Header'),
      body: Container(
        child: new ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: 100,
            itemBuilder: (context, index) {
              return new Container(
                height: 200,
                color: ColorConst.appColor,
                child: new StickWidget(
                  ///header
                  stickHeader: new Container(
                    height: 50.0,
                    color:ColorConst.appColor,
                    padding: new EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    child: new InkWell(
                      onTap: () {
                        printLog(msg: "header");
                      },
                      child: new Text(
                        'Header Item $index',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  ///content
                  stickContent: new InkWell(
                    onTap: () {
                      printLog(msg: "content");
                    },
                    child: new Container(
                      margin: EdgeInsets.only(left: 10),
                      color: ColorConst.whiteColor,
                      height: 150,
                      child: new Center(
                        child: new Text(
                          'Item Index $index ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
