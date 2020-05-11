import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/github/git_user_bean.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'git_user_info.dart';

class GitUsers extends StatefulWidget {
  @override
  _GitUsersState createState() => _GitUsersState();
}

class _GitUsersState extends State<GitUsers> {
//  var pageCount = 1;
  var pageCount = 38448418;
  List<GitUserBean> _userResult = new List();
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;
  BuildContext ctx;

  @override
  void initState() {
    callApi();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 8000) {
        pageCount++;
        callApi();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.GITHUB_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return new Container(
      child: new ListView.builder(
          controller: _scrollController,
          itemCount: _userResult.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == _userResult.length)
              return showPbIndicator(_isLoading);
            else
              return _usersRow(index);
          }),
    );
  }

  Widget _usersRow(int index) {
    GitUserBean users = _userResult[index];
    return new GestureDetector(
      onTap: () {
        debugPrint("pos : $index");
        nextScreen(users.login, users.url);
      },
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 3, right: 3),
          child: new Row(
            children: <Widget>[
              loadCircleImg(users.avatarUrl.toString(), 0, 80.0),
              Padding(padding: EdgeInsets.only(left: 8)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getTxtBlackColor(
                        users.login.toString(), 16, FontWeight.bold),
                    getTxtBlackColor("Node Id : ${users.nodeId.toString()}", 14,
                        FontWeight.normal),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> callApi() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      var queryParameters = {
        'since': pageCount.toString(),
      };
      var uri = Uri.https(
          ApiConst.GITHUB_BASE_URL, ApiConst.GIT_USERS, queryParameters);
      print('URI  :  ' + uri.path);
      var response =
          await http.get(uri, headers: {"Accept": "application/json"});
      setState(() {
        _isLoading = false;
        if (response.statusCode == 200) {
          debugPrint(response.body);
          jsonDecode(response.body).forEach((v) {
            _userResult.add(new GitUserBean.map(v));
          });
          print('Login    : ' + _userResult[0].login);
        } else {
          throw Exception('Unable to fetch products from the REST API');
        }
      });
    }
    return "Success";
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void nextScreen(title, url) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GitUserInfo(title, url),
        ));
  }
}
