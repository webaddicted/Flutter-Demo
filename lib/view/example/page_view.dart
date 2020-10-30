import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageViewScreen extends StatefulWidget {
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen>
    with TickerProviderStateMixin {
  RefreshController _refreshController;
  int _lastReportedPage = 0;
  List<Widget> data = [];

  final PageController _pageController = PageController();

  void enterRefresh() {
    _refreshController.requestLoading();
  }

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: true);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      //     getAppBarWithBackBtn(ctx: context, title: StringConst.BAR_CODE_TITLE),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    // _ctx = context;
    return SmartRefresher(
      enablePullUp: true,
      enablePullDown: true,
      footer: ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
      ),
      controller: _refreshController,
      header: MaterialClassicHeader(),
      onRefresh: () async {
        print("onRefresh");
        await Future.delayed(const Duration(milliseconds: 4000));

        if (mounted) setState(() {});
        _refreshController.refreshFailed();
      },
      child: CustomScrollView(
        physics: PageScrollPhysics(),
        controller: _pageController,
        slivers: <Widget>[
          SliverFillViewport(
            // viewportFraction: 1/3,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // index = -index - 1;
                // Color c = index % 2 == 0 ? Colors.white : Colors.grey;
                return viewItem(Colors.tealAccent, 'Item  $index');
              },
            ),
          )
          //     delegate: SliverChildListDelegate([
          //   viewItem(Colors.amber, 'Item 0'),
          //   viewItem(Colors.deepOrange, 'Item 1'),
          //   viewItem(Colors.lightGreen, 'Item 2'),
          //   viewItem(Colors.tealAccent, 'Item 3'),
          //   viewItem(Colors.purpleAccent, 'Item 4'),
          //   viewItem(Colors.pink, 'Item 5'),
          // ]))
        ],
      ),
      onLoading: () {
        print("onload");
        Future.delayed(const Duration(milliseconds: 2000)).then((val) {
          _refreshController.loadComplete();
        });
      },
    );
  }

  Widget viewItem(Color pink, String txt) {
    return Container(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getTxtWhiteColor(
                msg: txt, fontSize: 25, fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getTxtWhiteColor(
                  msg: StringConst.DUMMY_TEXT,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center),
            ),
          ],
        ));
  }
}
