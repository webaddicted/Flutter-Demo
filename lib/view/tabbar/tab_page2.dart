import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class TabPage2 extends StatefulWidget {
  @override
  _TabPage2State createState() => _TabPage2State();
}

class _TabPage2State extends State<TabPage2>
    with SingleTickerProviderStateMixin {

  final List<Tab> tabs = <Tab>[
    new Tab(text: "Featured"),
    new Tab(text: "Popular"),
    new Tab(text: "Latest")
  ];

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text(StringConst.BOTTOM_NAVIGATION_TITLE,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        bottom: _getTab(),
      ),
      body: _createUi(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showAlertDialog(
              ctx: context, title: 'Add tab', msg: 'Add custom tab');
        },
      ),
    );
  }

  Widget _createUi() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        new FirstPage("First Screen"),
        new FirstPage("Second Screen"),
        new FirstPage("Second Screen"),
      ],
    );
  }

  TabBar _getTab() {
    return new TabBar(
      isScrollable: false,
      unselectedLabelColor: Colors.white,
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator:  BubbleTabIndicator(
        indicatorHeight: 25.0,
        indicatorColor: Colors.amber,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      tabs: tabs,
      controller: _tabController,
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
