import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomNavPage3 extends StatefulWidget {
  @override
  _BottomNavPage3State createState() => _BottomNavPage3State();
}

class _BottomNavPage3State extends State<BottomNavPage3> {
  BuildContext ctx;
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_NAVIGATION_TITLE),
      bottomNavigationBar: getBottom(),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return _getPage(currentPage);
  }

  Widget getBottom() {
    return FancyBottomNavigation(
      tabs: [
        TabData(
            iconData: Icons.home,
            title: "Home",
            onclick: () {
              final FancyBottomNavigationState fState =
                  bottomNavigationKey.currentState;
              fState.setPage(2);
            }),
        TabData(
            iconData: Icons.search,
            title: "Search",
            onclick: () {
              // Navigator.of(context)
              //     .push(
              //     MaterialPageRoute(builder: (context) => SecondPage()));
            }),
        TabData(iconData: Icons.shopping_cart, title: "Basket")
      ],
      initialSelection: 1,
      key: bottomNavigationKey,
      onTabChangedListener: (position) {
        setState(() {
          currentPage = position;
        });
      },
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the home page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
            RaisedButton(
              child: Text(
                "Change to page 3",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                final FancyBottomNavigationState fState =
                    bottomNavigationKey.currentState;
                fState.setPage(2);
              },
            )
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the search page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => SecondPage()));
              },
            )
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the basket page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }

}
