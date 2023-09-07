import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/keep_alive_page.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomNavPage1 extends StatefulWidget {
  const BottomNavPage1({super.key});

  @override
  State<BottomNavPage1> createState() => _BottomNavPage1State();
}

class _BottomNavPage1State extends State<BottomNavPage1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late BuildContext ctx;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      printLog(msg: "Selected Index: ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_NAVIGATION_TITLE),
      bottomNavigationBar: Material(
        color: ColorConst.appColor,
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
        FirstPage("First Screen"),
        FirstPage("Second Screen")
        // KeepAlivePage(FirstPage("First Screen")),
        // KeepAlivePage(FirstPage("Second Screen")),
      ],
    );
  }

  TabBar _getTab() {
    return TabBar(
      controller: _tabController,
      tabs: const <Widget>[
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

  FirstPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Center(
        child: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
      ),
    );
  }
}
