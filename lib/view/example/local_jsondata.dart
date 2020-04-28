import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'dart:convert';

import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class LocalData extends StatefulWidget {
  @override
  _LocalDataState createState() => _LocalDataState();
}

class _LocalDataState extends State<LocalData> {
  BuildContext ctx;
  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        getAppBarWithBackBtn(context, StringConst.LOCAL_JSON_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        )
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return new Container(
      child: new FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString(AssetsConst.LOAD_JSON),
          builder: (context, snapshot) {
            debugPrint(snapshot.data.toString());
            var myData = jsonDecode(snapshot.data.toString());
            debugPrint(snapshot.data.toString());
            return createUi(myData);
          }),
    );
  }

  Widget createUi(List data) {
    return new Container(
      child: new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return getListRow(data, index);
          }),
    );
  }

  Widget getListRow(List dataResult, int index) {
    return new Card(
      elevation: 2,
      color: ColorConst.WHITE_COLOR,
      margin: EdgeInsets.all(4),
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(top: 8)),
            new Text(
              dataResult[index]["name"],
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            new Padding(padding: EdgeInsets.only(top: 5)),
            new Text("Age : ${dataResult[index]["age"]}"),
            new Padding(padding: EdgeInsets.only(top: 5)),
            new Text("Branch : ${dataResult[index]["branch"]}"),
            new Padding(padding: EdgeInsets.only(top: 5)),
            new Text("Education : ${dataResult[index]["education"]}"),
            new Padding(padding: EdgeInsets.only(bottom: 8)),
          ],
        ),
      ),
    );
  }
}
