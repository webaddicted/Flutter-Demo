import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/movie/movie_respo.dart';
import 'package:flutterbeginner/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class RefreshPage extends StatefulWidget {
  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  final int pageSize = 30;
  bool disposed = false;
  List<String> dataList = new List();
  final ScrollController _scrollController = new ScrollController();
  final GlobalKey<RefreshIndicatorState> refreshKey = new GlobalKey();

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    dataList.clear();
    for (int i = 0; i < pageSize; i++) {
      dataList.add("refresh");
    }
    if (disposed) {
      return;
    }
    setState(() {});
  }

  Future<void> loadMore() async {
    await Future.delayed(Duration(seconds: 2));
    for (int i = 0; i < pageSize; i++) {
      dataList.add("loadmore");
    }
    if (disposed) {
      return;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    Future.delayed(Duration(seconds: 0), () {
      refreshKey.currentState.show();
    });
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("RefreshDemoPage"),
      ),
      body: Container(
        child: new RefreshIndicator(
          key: refreshKey,
          onRefresh: onRefresh,
          child: new ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == dataList.length) {
                return new Container(
                  margin: EdgeInsets.all(10),
                  child: Align(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Card(
                child: new Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: new Text("Item ${dataList[index]} $index"),
                ),
              );
            },
            itemCount: (dataList.length >= pageSize)
                ? dataList.length + 1
                : dataList.length,
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}
