import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomNavPage6 extends StatefulWidget {
  const BottomNavPage6({super.key});

  @override
  State<BottomNavPage6> createState() => _BottomNavPage6State();
}

class _BottomNavPage6State extends State<BottomNavPage6>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isHomeSelected = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');
  late BuildContext ctx;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      printLog(msg: "Selected Index: ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.BOTTOM_NAVIGATION_TITLE),
        bottomNavigationBar: bottomNavTab(),
        body: _createUi(context));
  }

  Widget bottomNavTab() {
    return Container(
      color: ColorConst.circleFade2,
      child: TabBar(
        controller: _tabController,
        indicator: const BoxDecoration(
            color: ColorConst.appSecondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
            boxShadow: [
              BoxShadow(color: ColorConst.appSecondaryColor, blurRadius: 6.0)
            ]),
        labelStyle: const TextStyle(fontSize: 12),
        tabs: const <Widget>[
          Tab(text: "Home", icon: Icon(Icons.home)),
          Tab(text: "Profile", icon: Icon(Icons.supervised_user_circle_sharp)),
          Tab(text: "Share", icon: Icon(Icons.share_rounded)),
          Tab(text: "Rating", icon: Icon(Icons.stars_outlined)),
          Tab(text: "Contact", icon: Icon(Icons.contact_support_outlined)),
        ],
      ),
    );
  }

  Widget _createUi(BuildContext context) {
    return TabBarView(controller: _tabController, children: <Widget>[
      InkWell(
          onTap: () {
            _tabController.animateTo(2);
          },
          child: Center(
              child: getTxtAppColor(
                  msg: "Home", fontSize: 18, fontWeight: FontWeight.bold))),
      Center(
          child: getTxtAppColor(
              msg: "Profile", fontSize: 18, fontWeight: FontWeight.bold)),
      Center(
          child: getTxtAppColor(
              msg: "Share", fontSize: 18, fontWeight: FontWeight.bold)),
      Center(
          child: getTxtAppColor(
              msg: "Rate App", fontSize: 18, fontWeight: FontWeight.bold)),
      Center(
          child: getTxtAppColor(
              msg: "Contact Us", fontSize: 18, fontWeight: FontWeight.bold))
    ]);
  }
}
