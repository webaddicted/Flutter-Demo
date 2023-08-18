import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/github/git_user_info_bean.dart';
import 'package:http/http.dart' as http;
import 'package:flutterbeginner/view/local/image/full_image.dart';
class HttpsGitUserInfo extends StatefulWidget {
  final String title, url, tag;
  const HttpsGitUserInfo(this.title, this.url, this.tag, {super.key});

  @override
  State<HttpsGitUserInfo> createState() => _HttpsGitUserInfoState();
}

class _HttpsGitUserInfoState extends State<HttpsGitUserInfo> {
  GitUserInfoBean? dataResult;
  late BuildContext ctx;

  @override
  void initState() {
    super.initState();
    callApi(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context,title:widget.title),
      body: _createUi(context)
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (dataResult == null) {
      return showPbIndicator();
    } else {
      return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 100)),
              GestureDetector(
                  onTap: () {
                    navigationPush(context, FullImage(dataResult?.avatarUrl, null, widget.tag));
                  },
                  child: Hero(tag: widget.tag,child: loadCircleImg(dataResult!.avatarUrl!, 0, 180))),
              const Padding(padding: EdgeInsets.only(top: 15)),
              Hero(tag: 'title${widget.tag}',child: getTxtBlackColor(msg:dataResult?.name??"N/A", fontSize:17, fontWeight:FontWeight.bold)),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Hero(tag: 'node${widget.tag}',
                child: getTxtBlackColor(
                    msg:'User name : ${dataResult?.login??"N/A"}', fontSize:15),
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Company : ${dataResult?.company??"N/A"}', fontSize:15),
              const Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Address : ${dataResult?.location??"N/A"}', fontSize:15),
              const Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Total public repository : ${dataResult?.publicRepos??"N/A"}',
                  fontSize:15),
              const Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Followers : ${dataResult?.followers??"0"}', fontSize:15),
              const Padding(padding: EdgeInsets.only(top: 5)),
              getTxtBlackColor(
                  msg:'Following : ${dataResult?.following??"0"}', fontSize: 15),
              const Padding(padding: EdgeInsets.only(top: 50)),
            ],
          ),
        ),
      );
    }
  }

  Future<String> callApi(String url) async {
    printLog(msg: url);
    var response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    setState(() {
      if (response.statusCode == 200) {
        printLog(msg: response.body);
        dataResult = GitUserInfoBean.map(jsonDecode(response.body));
      } else {
        throw Exception('Unable to fetch products from the REST API');
      }
    });
    return "Success";
  }
}
