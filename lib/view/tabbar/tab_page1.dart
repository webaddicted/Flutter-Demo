import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class TabPage1 extends StatefulWidget {
  @override
  _TabPage1State createState() => _TabPage1State();
}

class _TabPage1State extends State<TabPage1>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
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
      ],
    );
  }

  TabBar _getTab() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.white,
      indicatorWeight: 3.0,
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
