import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/github/git_user_info_bean.dart';
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
  GitUserInfoBean dataResult;
  BuildContext ctx;
  bool _isLoading;
  _GitUserInfoState(this.title, this.url);

  @override
  void initState() {
    super.initState();
    callApi(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, title),
      body:Builder(builder: (context) {
            return _createUi(context);
          })
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (dataResult == null)
      return showPbIndicator(_isLoading);
    else
      return new Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 100)),
              loadCircleImg(dataResult.avatarUrl, 0, 180),
              Padding(padding: EdgeInsets.only(top: 15)),
              getTxtBlackColor(dataResult.name.toString(), 17, FontWeight.bold),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  'User name : ${dataResult.login}', 15, FontWeight.normal),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  'Company : ${dataResult.company}', 15, FontWeight.normal),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  'Address : ${dataResult.location}', 15, FontWeight.normal),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  'Total public repository : ${dataResult.publicRepos}',
                  15,
                  FontWeight.normal),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  'Followers : ${dataResult.followers}', 15, FontWeight.normal),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  'Following : ${dataResult.following}', 15, FontWeight.normal),
              Padding(padding: EdgeInsets.only(top: 50)),
            ],
          ),
        ),
      );
  }

  Future<String> callApi(String url) async {
    debugPrint(url);
    _isLoading = true;
    var response = await http.get(url, headers: {"Accept": "application/json"});
    setState(() {
      if (response.statusCode == 200) {
        debugPrint(response.body);
        dataResult = GitUserInfoBean.map(jsonDecode(response.body));
        _isLoading = false;
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    });
    return "Success";
  }
}
