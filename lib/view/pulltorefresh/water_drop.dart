import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:http/http.dart' as HTTP;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WaterDrop extends StatefulWidget {
  @override
  _WaterDropState createState() =>
      _WaterDropState();
}

class _WaterDropState extends State<WaterDrop>
    with TickerProviderStateMixin {
  int indexPage = 0;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<String> data = [];

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.PAGINATION_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: 1.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _createUi(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      child: buildCtn(),
      header: WaterDropHeader(),
      onRefresh: ()  async{
        _fetch();
        _refreshController.refreshCompleted();
      },
      onLoading: ()  async{
        _fetch();
        _refreshController.loadComplete();
      },
    );
  }
  void _fetch() {
    print('https://gank.io/api/v2/data/category/Girl/type/Girl/page/$indexPage/count/10');
    HTTP
        .get(
            Uri.parse('https://gank.io/api/v2/data/category/Girl/type/Girl/page/$indexPage/count/10'))
        .then((HTTP.Response response) {
      Map map = json.decode(response.body);
      return map["data"];
    }).then((array) {
      for (var item in array) {
        data.add(item["url"]);
      }
      indexPage++;
      if (mounted) {
        setState(() {});
      }
      // _controller1.loadComplete();
    }).catchError((err) {
      print("error $err");
    });
  }

  Widget buildCtn() {
    if (data.length == 0) return _buildProgressIndicator();
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(),
        SliverAppBar(
          title: Text("SliverAppBar"),
          expandedHeight: 100.0,
          pinned: true,
          // leading: ,
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5 / 2.2,
            ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(1),
                child: CachedNetworkImage(
                  height: 140,
                  width: 120,
                  placeholder: (context, url) => Container(color: Colors.grey),
                  imageUrl: data[index],
                  fit: BoxFit.fill,
                ),
              );
            },
            childCount: data.length,
          ),
        ),
      ],
    );
  }
}
