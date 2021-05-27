import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/github/git_user_info_bean.dart';
import 'package:http/http.dart' as http;
import 'package:flutterbeginner/view/local/image/full_image.dart';
class GitUserInfo extends StatefulWidget {
  final String title, url;

  var tag;

  GitUserInfo(this.title, this.url, this.tag);

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
      appBar: getAppBarWithBackBtn(ctx:context,title:title),
      body:Builder(builder: (context) {
            return _createUi(context);
          })
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (dataResult == null)
      return showPbIndicator();
    else
      return new Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 100)),
              GestureDetector(
                  onTap: () {
                    navigationPush(context, FullImage(dataResult.avatarUrl, null, widget.tag));
                  },
                  child: Hero(tag: widget.tag,child: loadCircleImg(dataResult.avatarUrl, 0, 180))),
              Padding(padding: EdgeInsets.only(top: 15)),
              Hero(tag: 'title${widget.tag}',child: getTxtBlackColor(msg:dataResult.name.toString(), fontSize:17, fontWeight:FontWeight.bold)),
              Padding(padding: EdgeInsets.only(top: 5)),
              Hero(tag: 'node${widget.tag}',
                child: getTxtBlackColor(
                    msg:'User name : ${dataResult.login}', fontSize:15),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Company : ${dataResult.company}', fontSize:15),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Address : ${dataResult.location}', fontSize:15),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Total public repository : ${dataResult.publicRepos}',
                  fontSize:15),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Followers : ${dataResult.followers}', fontSize:15),
              Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Following : ${dataResult.following}', fontSize: 15),
              Padding(padding: EdgeInsets.only(top: 50)),
            ],
          ),
        ),
      );
  }

  Future<String> callApi(String url) async {
    debugPrint(url);
    _isLoading = true;
    var response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
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
