import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/github/git_user_bean.dart';
import 'package:http/http.dart' as http;

import 'https_git_user_info.dart';

class HttpsGitUsers extends StatefulWidget {
  const HttpsGitUsers({super.key});
  @override
  State<HttpsGitUsers> createState() => _HttpsGitUsersState();
}

class _HttpsGitUsersState extends State<HttpsGitUsers> {
  var pageCount = 38448418;
  final List<GitUserBean> _userResult = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  late BuildContext ctx;

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
        appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.GITHUB_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return ListView.builder(
        controller: _scrollController,
        itemCount: _userResult.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == _userResult.length) {
            return showPbIndicator();
          } else {
            return _usersRow(index);
          }
        });
  }

  Widget _usersRow(int index) {
    GitUserBean users = _userResult[index];
    return GestureDetector(
      onTap: () {
        printLog(msg: "pos : $index");
        nextScreen(users.login, users.url,'users${users.id}$index');
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 3, right: 3),
          child: Row(
            children: <Widget>[
              Hero(tag: 'users${users.id}$index',
              child: loadCircleImg(users.avatarUrl.toString(), 0, 80.0)),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(tag: 'titleusers${users.id}$index',
                      child: getTxtBlackColor(
                          msg:users.login.toString(), fontSize:16, fontWeight:FontWeight.bold),
                    ),
                    Hero(tag: 'nodeusers${users.id}$index',child: getTxtBlackColor(msg:"Node Id : ${users.nodeId.toString()}", fontSize:14)),
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
          ApiConstant.GITHUB_BASE_URL, ApiConstant.GIT_USERS, queryParameters);
      printLog(msg: 'URI  :  ${uri.path}');
      var response =
          await http.get(uri, headers: {"Accept": "application/json"});
      setState(() {
        _isLoading = false;
        if (response.statusCode == 200) {
          printLog(msg: response.body);
          jsonDecode(response.body).forEach((v) {
            _userResult.add(GitUserBean.map(v));
          });
          printLog(msg: 'Login    : ${_userResult[0].login}');
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

  void nextScreen(title, url, String tag) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HttpsGitUserInfo(title, url, tag),
        ));
  }
}
