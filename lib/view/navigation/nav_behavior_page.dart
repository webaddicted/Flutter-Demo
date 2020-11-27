import 'package:drawerbehavior/drawer_scaffold.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/example/calculator_app.dart';

class NavBehaviorPage extends StatefulWidget {
  @override
  _NavBehaviorPageState createState() => _NavBehaviorPageState();
}

class _NavBehaviorPageState extends State<NavBehaviorPage> {
  int selectedMenuItemId;
  int drawerType = 0;

  @override
  void initState() {
    selectedMenuItemId = menu.items[0].id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      appBar: AppBar(
          title: Text("Drawer - 3D"),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})]),
      drawers: getDrawer(drawerType),
      builder: (context, id) => IndexedStack(
        index: id,
        children: menu.items
            .map((e) => Center(
                  child: Column(
                    children: [
                      Text("Page~${e.title}"),
                      RaisedButton(
                        child: getTxt(msg: 'DrawerCustomItem '),
                        onPressed: () {
                          drawerType = 0;
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: getTxt(msg: 'Drawer3d'),
                        onPressed: () {
                          drawerType = 1;
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: getTxt(msg: 'DrawerScale '),
                        onPressed: () {
                          drawerType = 2;
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: getTxt(msg: 'DrawerSlideWithFooter '),
                        onPressed: () {
                          drawerType = 3;
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: getTxt(msg: 'DrawerScaleIcon  '),
                        onPressed: () {
                          drawerType = 4;
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                        child: getTxt(msg: 'DrawerLeftAndRightInverse '),
                        onPressed: () {
                          drawerType = 5;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  getDrawer(drawerType) {
    if (drawerType == 0) {
      return [
        SideDrawer(
          percentage: 1,
          menu: menu,
          headerView: headerView(context),
          animation: false,
          alignment: Alignment.topLeft,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          itemBuilder:
              (BuildContext context, MenuItem menuItem, bool isSelected) {
            return Container(
                color: isSelected
                    ? Theme.of(context).accentColor.withOpacity(0.7)
                    : Colors.transparent,
                padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: getTxtColor(
                  msg: menuItem.title,
                  fontSize: 15,
                  txtColor: isSelected ? Colors.white : Colors.white70,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                )

                // Text(
                //   menuItem.title,
                //   style: Theme.of(context).textTheme.subhead.copyWith(
                //       color: isSelected ? Colors.white : Colors.white70),
                // ),
                );
          },
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        )
      ];
    } else if (drawerType == 1) {
      return [
        SideDrawer(
          percentage: 0.8,
          degree: 45,
          menu: menu,
          direction: Direction.left,
          animation: true,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        ),
        SideDrawer(
          degree: 45,
          menu: menu,
          direction: Direction.right,
          animation: true,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        )
      ];
    } else if (drawerType == 2) {
      return [
        SideDrawer(
          percentage: 0.6,
          menu: menu,
          direction: Direction.left,
          animation: true,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        )
      ];
    } else if (drawerType == 3) {
      return [
        SideDrawer(
          percentage: 1,
          menu: menu,
          footerView: footerView(context),
          animation: false,
          alignment: Alignment.topLeft,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        )
      ];
    } else if (drawerType == 4) {
      return [
        SideDrawer(
          percentage: 0.6,
          menu: menuWithIcon,
          animation: true,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        )
      ];
    } else if (drawerType == 5) {
      return [
        SideDrawer(
          percentage: 0.6,
          menu: menu,
          direction: Direction.left,
          animation: true,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        ),
        SideDrawer(
          menu: menu,
          direction: Direction.right,
          animation: true,
          selectorColor: Colors.white,
          color: Theme.of(context).accentColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        ),
      ];
    } else
      Container();
  }

  Widget headerView(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: <Widget>[
              new Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AssetsConst.DEEPAK_IMG)))),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getTxtWhiteColor(
                          msg: StringConst.DEEPAK_SHARMA,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      getTxtWhiteColor(
                          msg: StringConst.EMAIL,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ],
                  ))
            ],
          ),
        ),
        Divider(
          color: Colors.white.withAlpha(200),
          height: 16,
        )
      ],
    );
  }

  Widget footerView(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          color: Colors.white.withAlpha(200),
          height: 16,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: <Widget>[
              new Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AssetsConst.DEEPAK_IMG)))),
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getTxtWhiteColor(
                          msg: StringConst.DEEPAK_SHARMA,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      getTxtWhiteColor(
                          msg: StringConst.EMAIL,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }
}

List<MenuItem> items = [
  new MenuItem<int>(
    id: 0,
    title: 'THE PADDOCK',
    icon: Icons.fastfood,
  ),
  new MenuItem<int>(
    id: 1,
    title: 'THE HERO',
    icon: Icons.person,
  ),
  new MenuItem<int>(
    id: 2,
    title: 'HELP US GROW',
    icon: Icons.terrain,
  ),
  new MenuItem<int>(
    id: 3,
    title: 'SETTINGS',
    icon: Icons.settings,
  ),
];
final menu = Menu(
  items: items.map((e) => e.copyWith(icon: null)).toList(),
);

final menuWithIcon = Menu(
  items: items,
);
