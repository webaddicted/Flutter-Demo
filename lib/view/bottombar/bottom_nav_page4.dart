import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomNavPage4 extends StatefulWidget {
  const BottomNavPage4({super.key});

  @override
  State<BottomNavPage4> createState() => _BottomNavPage4State();
}

class _BottomNavPage4State extends State<BottomNavPage4> with SingleTickerProviderStateMixin {
  late BuildContext ctx;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');

  @override
  void initState() {
    super.initState();
    pages = [
      Center(child: Container(child: getTxtAppColor(
          msg: "Home", fontSize: 22, fontWeight: FontWeight.bold))),
      Center(child: Container(child: getTxtAppColor(
          msg: "Profile", fontSize: 22, fontWeight: FontWeight.bold))),
      Center(child: Container(child: getTxtAppColor(
          msg: "Share", fontSize: 22, fontWeight: FontWeight.bold))),
      Center(child: Container(child: getTxtAppColor(
          msg: "Rate App", fontSize: 22, fontWeight: FontWeight.bold))),
      Center(child: Container(child: getTxtAppColor(
          msg: "Contact Us", fontSize: 22, fontWeight: FontWeight.bold)))
    ];
    currentPage = pages[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.BOTTOM_NAVIGATION_TITLE),
        bottomNavigationBar: getBottom(),
        body: currentPage);
  }

  BottomNavigationBar getBottom() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined),
          label: 'Profile'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.share),
          label: 'Share'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stars_outlined),
          label: 'Rating'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_support_outlined),
          label: 'Contact'
        )
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      backgroundColor: ColorConst.appColor,
      selectedIconTheme:
      const IconThemeData(color: ColorConst.whiteColor, size: 30),
      selectedLabelStyle: const TextStyle(color: ColorConst.whiteColor),
      unselectedIconTheme:
      const IconThemeData(color: ColorConst.greyColor, size: 30),
      unselectedItemColor: ColorConst.greyColor,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
      elevation: 10,
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      if (value == 0) {
        currentPage = pages[0];
      } else if (value == 1) {
        currentPage = pages[1];
      } else if (value == 2) {
        currentPage = pages[2];
      } else if (value == 3) {
        currentPage = pages[3];
      } else if (value == 4) {
        currentPage = pages[4];
      }
      selectedIndex = value;
    });
  }
}
