import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class TabPage1 extends StatefulWidget {
  const TabPage1({super.key});

  @override
  State<TabPage1> createState() => _TabPage1State();
}

class _TabPage1State extends State<TabPage1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringConst.BOTTOM_NAVIGATION_TITLE,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        bottom: _getTab(),
      ),
      body: _createUi(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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
        FirstPage("First Screen"),
        FirstPage("Second Screen"),
      ],
    );
  }

  TabBar _getTab() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.white,
      indicatorWeight: 3.0,
      tabs: const <Widget>[
        Tab(icon: Icon(Icons.favorite)),
        Tab(icon: Icon(Icons.email),),
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
