import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GitUserInfo extends StatefulWidget {
  final String title, url;

  GitUserInfo(this.title, this.url);

  @override
  _GitUserInfoState createState() => _GitUserInfoState(this.title, this.url);
}

class _GitUserInfoState extends State<GitUserInfo> {
  String title, url;
  var dataResult;
  BuildContext ctx;
  _GitUserInfoState(this.title, this.url);

  @override
  void initState() {
    super.initState();
    debugPrint("title  $title\n url $url ");
    callApi(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        getAppBarWithBackBtn(context, title),
        body: Builder(
          builder: (context) => _createUi(context),
        )
    );
//    return getAppBarWithBackBtn(context, title, _createUi());
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (dataResult == null)
      return Container();
    else
      return new Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 100)),
              loadCircleImg(dataResult["avatar_url"], 0, 180),
              Padding(padding: EdgeInsets.only(top: 15)),
              Text(
                dataResult["name"],
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "User name : ${dataResult["login"]}",
                style: TextStyle(fontSize: 15),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Company : ${dataResult["company"]}",
                style: TextStyle(fontSize: 15),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Address : ${dataResult["location"]}",
                style: TextStyle(fontSize: 15),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Total public repository : ${dataResult["public_repos"]}",
                style: TextStyle(fontSize: 15),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Followers : ${dataResult["followers"]}",
                style: TextStyle(fontSize: 15),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                "Following : ${dataResult["following"]}",
                style: TextStyle(fontSize: 15),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
            ],
          ),
        ),
      );
  }

  Future<String> callApi(String url) async {
    var response = await http.get(url, headers: {"Accept": "application/json"});
    setState(() {
      if (response.statusCode == 200) {
        debugPrint(response.body);
        dataResult = jsonDecode(response.body);
        debugPrint(
            "${dataResult["login"]}  ${dataResult["email"]}  ${dataResult["followers"]}");
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    });
    return "Success";
  }
}
