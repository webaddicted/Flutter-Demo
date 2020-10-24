import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/corona_respo.dart';
import 'package:http/http.dart' as http;

class ApiHttpPage extends StatefulWidget {
  @override
  _ApiHttpPageState createState() => _ApiHttpPageState();
}

class _ApiHttpPageState extends State<ApiHttpPage> {
  List dataResult;
  BuildContext ctx;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    callApi();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.CORONA_REPORT_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (dataResult == null ||0 == dataResult.length)
      return showPbIndicator();
    return new Container(
      child: new ListView.builder(
          itemCount: dataResult == null ? 0 : dataResult.length,
          itemBuilder: (BuildContext context, int index) {
              return createRow(index);
          }),
    );
  }

  Widget createRow(int index) {
    return GestureDetector(
      onTap: () => {
        debugPrint("TotalConfirmed"),
        showAlertDialog(ctx:context,
            title:"${dataResult[index]["Country"]}",
            msg:"Total Confirmed Case : ${dataResult[index]["TotalConfirmed"]}\nClick position : $index")
      },
      child: Card(
        margin: EdgeInsets.all(3),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 5)),
              new Text("${dataResult[index]["Country"]}",
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Text("CountryCode : ${dataResult[index]["CountryCode"]}"),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Text("Slug : ${dataResult[index]["Slug"]}"),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Text(
                  "NewConfirmed Case : ${dataResult[index]["NewConfirmed"]}"),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Text(
                  "TotalConfirmed Case : ${dataResult[index]["TotalConfirmed"]}"),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Text("NewDeaths Case : ${dataResult[index]["NewDeaths"]}"),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Text(
                  "TotalDeaths Case : ${dataResult[index]["TotalDeaths"]}"),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Text(
                  "NewRecovered Case : ${dataResult[index]["NewRecovered"]}"),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Text(
                  "TotalRecovered Case : ${dataResult[index]["TotalRecovered"]}"),
              new Padding(padding: EdgeInsets.only(top: 3)),
              new Align(
                alignment: Alignment.centerRight,
                child: new Text(
                  "${dataResult[index]["Date"]}",
                  style: new TextStyle(color: ColorConst.GREY_COLOR),
                ),
              ),
              new Padding(padding: EdgeInsets.only(bottom: 5)),
            ],
          ),
        ),
      ),
    );
  }

  callApi() async {
    var response = await http
        .get(ApiConst.CORONA_URL, headers: {"Accept": "application/json"});
    setState(() {
      if (response.statusCode == 200) {
        debugPrint(response.body);
        var coronaRespo = CoronaRespo.fromJson(jsonDecode(response.body));
        var converData = jsonDecode(response.body);
        debugPrint(
            "Print Respo  :  " + coronaRespo.global.newConfirmed.toString());
        dataResult = converData["Countries"];
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    });
//    return "Success";
  }
}
