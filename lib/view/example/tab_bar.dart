import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
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
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: (){
          showAlertDialog(context, 'Add tab','Add custom tab');
        },),
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
        child: getTxtBlackColor(title, null, FontWeight.bold),
      ),
    );
  }
}
