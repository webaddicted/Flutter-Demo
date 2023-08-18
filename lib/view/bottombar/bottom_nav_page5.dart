import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
// import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class BottomNavPage5 extends StatefulWidget {
  @override
  _BottomNavPage5State createState() => _BottomNavPage5State();
}

class _BottomNavPage5State extends State<BottomNavPage5> {
  late BuildContext ctx;
  int _currentTabIndex = 3;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_NAVIGATION_TITLE),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text("Reversed mode:"),
    ]));
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      unselectedItemColor: Color.fromRGBO(67, 72, 155, 0.5),
      selectedItemColor: Color.fromRGBO(67, 72, 155, 1.0),
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            height: 30.0,
            width: 30.0,
            child: Icon(Icons.home),
          ),
          label: "Your plan",
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 30.0,
            width: 30.0,
            child: Icon(Icons.search),
          ),
          label: "Your Care",
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 30.0,
            width: 30.0,
            child: Icon(Icons.shopping_cart),
          ),
          label: "Tips & Strategies",
        ),
        BottomNavigationBarItem(
          icon: Container(
            height: 25.0,
            width: 25.0,
            child: Icon(Icons.person_outline),
          ),
          label: "Your Profile",
        ),
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        // _navigatorKey.currentState.pushReplacementNamed("Your Plan");
        break;
      case 1:
        // _navigatorKey.currentState.pushReplacementNamed("Your Care");
        break;
      case 2:
        // _navigatorKey.currentState.pushReplacementNamed("Tips");
        break;
      case 3:
        // _navigatorKey.currentState.pushReplacementNamed("Your Profile");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

}
