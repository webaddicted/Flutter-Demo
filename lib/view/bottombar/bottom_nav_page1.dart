import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomNavPage1 extends StatefulWidget {
  @override
  _BottomNavPage1State createState() => _BottomNavPage1State();
}

class _BottomNavPage1State extends State<BottomNavPage1>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  BuildContext ctx;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_NAVIGATION_TITLE),
      bottomNavigationBar: new Material(
        color: ColorConst.APP_COLOR,
        child: _getTab(),
      ),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        new FirstPage("First Screen"),
        new FirstPage("Second Screen"),
      ],
    );
  }

  TabBar _getTab() {
    return TabBar(
      controller: _tabController,
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.favorite),
        ),
        Tab(
          icon: Icon(Icons.email),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class FirstPage extends StatelessWidget {
  String title = '';

  FirstPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Center(
        child: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
      ),
    );
  }
}
