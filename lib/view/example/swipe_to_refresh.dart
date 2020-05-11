import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:image_picker/image_picker.dart';

class SwipeToRefresh extends StatefulWidget {
  @override
  _SwipeToRefreshState createState() => _SwipeToRefreshState();
}

class _SwipeToRefreshState extends State<SwipeToRefresh> {
  var list;
  var random;

  var refreshKey = GlobalKey<RefreshIndicatorState>();
  BuildContext _ctx;
  @override
  void initState() {
    list = List.generate(3, (i) => "Item $i");
    super.initState();
    random = Random();
    refreshList();
  }
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      list = List.generate(random.nextInt(10), (i) => "Item $i");
    });

    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, StringConst.SWIPE_TO_REFRESH_TITLE),
      body: Builder(builder: (_context) {
        return _createUi(_context);
      }),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return RefreshIndicator(
      key: refreshKey,
      child: ListView.builder(
        itemCount: list?.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(list[i]),
        ),
      ),
      onRefresh: refreshList,
    );
  }
}
