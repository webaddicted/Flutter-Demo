import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page1.dart';
import 'package:flutterbeginner/view/example/calculator_app.dart';
import 'package:flutterbeginner/view/login/login_page.dart';

class NavLikeFragPage extends StatefulWidget {
  final drawerFragments = [
    new DrawerItem("Fragment 1", Icons.rss_feed, () => new FirstPage('title')),
    new DrawerItem("Fragment 2", Icons.local_pizza, () => new FirstPage('title  2')),
    new DrawerItem("Fragment 3", Icons.info, () => new FirstPage('title 3 '))
  ];

  final drawerScreens = [
    new DrawerItem("Counter", Icons.add_circle, () => new LoginPage()),
    new DrawerItem("Screen 2", Icons.airport_shuttle, () => new LoginPage()),
    new DrawerItem("Screen 3", Icons.all_inclusive, () => new LoginPage())
  ];


  @override
  _NavLikeFragPageState createState() => _NavLikeFragPageState();
}
class DrawerItem {
  String title;
  IconData icon;
  Function body;
  DrawerItem(this.title, this.icon, this.body);
}
class _NavLikeFragPageState extends State<NavLikeFragPage> {



  int _selectedDrawerFragmentIndex = 0;

  _getDrawerFragmentWidgetIndex(int pos) {
    if (widget.drawerFragments[pos] != null) {
      return widget.drawerFragments[pos].body();
    } else {
      return new Text("Error");
    }
  }

  _onSelectFragment(int index) {
    setState(() => _selectedDrawerFragmentIndex = index);
    Navigator.of(context).pop();
  }

  _onSelectScreen(int index) {
    if (widget.drawerScreens[index] != null) {
      Navigator.of(context).pop(); // close drawer
      Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => widget.drawerScreens[index].body())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];

    for (var i = 0; i < widget.drawerFragments.length; i++) {
      var d = widget.drawerFragments[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerFragmentIndex,
            onTap: () => _onSelectFragment(i),
          )
      );
    }

    for (var i = 0; i < widget.drawerScreens.length; i++) {
      var d = widget.drawerScreens[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            onTap: () => _onSelectScreen(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerFragments[_selectedDrawerFragmentIndex].title),
      ),
      drawer: new SizedBox(
        width: MediaQuery.of(context).size.width * 0.80,
        child: new Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(accountName: new Text("John Doe"), accountEmail: null),
              new Column(children: drawerOptions)
            ],
          ),
        ),
      ),
      body: _getDrawerFragmentWidgetIndex(_selectedDrawerFragmentIndex),
    );
  }
}