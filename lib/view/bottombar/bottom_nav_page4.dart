import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
// import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class BottomNavPage4 extends StatefulWidget {
  @override
  _BottomNavPage4State createState() => _BottomNavPage4State();
}

class _BottomNavPage4State extends State<BottomNavPage4> {
  late BuildContext ctx;
  //TODO UNDO
  // final List<TitledNavigationBarItem> items = [
  //   TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
  //   TitledNavigationBarItem(title: Text('Search'), icon: Icons.search),
  //   TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
  //   TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
  //   TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
  // ];

  bool navBarMode = false;

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
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text("Reversed mode:"),
      Switch(
        value: navBarMode,
        onChanged: (v) {
          setState(() => navBarMode = v);
        },
      )
    ]));
  }

  Widget getBottom() {
    return Container();
    //TODO UNDO
    // return TitledBottomNavigationBar(
    //   onTap: (index) => print("Selected Index: $index"),
    //   reverse: navBarMode,
    //   curve: Curves.easeInBack,
    //   items: items,
    //   activeColor: Colors.red,
    //   inactiveColor: Colors.blueGrey,
    // );
  }
}
