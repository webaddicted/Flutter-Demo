import 'dart:math';

// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StaggeredGridScreen extends StatefulWidget {
  @override
  _StaggeredGridScreenState createState() => _StaggeredGridScreenState();
}

class _StaggeredGridScreenState extends State<StaggeredGridScreen>
    with TickerProviderStateMixin {
  late RefreshController _refreshController;

  List<Widget> data = [];

  int length = 10;

  void _getDatas() {
    data.add(Row(
      children: <Widget>[
        MaterialButton(
            onPressed: () {
              _refreshController.requestRefresh();
            },
            child: Text("请求刷新")),
        MaterialButton(
            onPressed: () {
              _refreshController.requestLoading();
            },
            child: Text("请求加载数据"))
      ],
    ));
    for (int i = 0; i < 13; i++) {
      data.add(GestureDetector(
        child: Container(
          color: Color.fromARGB(255, 250, 250, 250),
          child: Card(
            margin:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: Center(
              child: Text('Data $i'),
            ),
          ),
        ),
        onTap: () {
          _refreshController.requestRefresh();
        },
      ));
    }
  }

  void enterRefresh() {
    _refreshController.requestLoading();
  }

  @override
  void initState() {
    // TODO: implement initState
    _getDatas();
    _refreshController = RefreshController(initialRefresh: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
  }

  List<bool> expand = [false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_SHEET_TITLE),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    List<Widget> slivers = [];
    slivers.add(GridView.builder(
      itemCount: length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5 / 1.8,
      ),
      itemBuilder: (BuildContext context, int index) => new Container(
          color: Colors
              .primaries[Random().nextInt(Colors.primaries.length)],
          child: new Center(
            child: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text('$index'),
            ),
          )),
    ));
    return LayoutBuilder(
      builder: (i, c) {
        return SmartRefresher(
          enablePullUp: true,
          enablePullDown: true,
          controller: _refreshController,
          header: MaterialClassicHeader(),
          onRefresh: () async {
            printLog(msg: "onRefresh");
            await Future.delayed(const Duration(milliseconds: 4000));
            if (mounted) setState(() {});
            _refreshController.refreshFailed();
          },
          child: CustomScrollView(
            slivers: slivers,
          ),
          onLoading: () {
            printLog(msg: "onload");
            Future.delayed(const Duration(milliseconds: 2000)).then((val) {
              length += 10;
              if (mounted) setState(() {});
              _refreshController.loadComplete();
            });
          },
        );
      },
    );
  }
}
