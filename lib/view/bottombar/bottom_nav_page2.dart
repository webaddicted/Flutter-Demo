import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomNavPage2 extends StatefulWidget {
  @override
  _BottomNavPage2State createState() => _BottomNavPage2State();
}

class _BottomNavPage2State extends State<BottomNavPage2> {
  int selectedIndex = 0;
  Color backgroundColorNav = Colors.white;
  BuildContext ctx;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text('Home'), Colors.deepPurpleAccent),
    NavigationItem(
        Icon(Icons.favorite_border), Text('Favorite'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.search), Text('Search'), Colors.amberAccent),
    NavigationItem(
        Icon(Icons.person_outline), Text('Profile'), Colors.cyanAccent)
  ];

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
    return Center(child: Text('Homepage!'));
  }

  Widget getBottom() {
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 50,
      width: isSelected ? 120 : 50,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.all(Radius.circular(50)))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroundColorNav : Colors.black,
                ),
                child: item.icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(color: backgroundColorNav),
                        child: item.title)
                    : Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;

  NavigationItem(this.icon, this.title, this.color);
}
