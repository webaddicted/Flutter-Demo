import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/customview/drawer_slide_controller.dart';
import 'package:flutterbeginner/global/customview/slide_drawer.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class NavDrawerSlidePage extends StatefulWidget {
  @override
  _NavDrawerSlidePageState createState() => _NavDrawerSlidePageState();
}

class _NavDrawerSlidePageState extends State<NavDrawerSlidePage> {
  BuildContext ctx;
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = Page1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConst.WHITE_COLOR,
      child: SafeArea(
        // top: false,
        // bottom: false,
        child: Scaffold(
          backgroundColor: ColorConst.WHITE_COLOR,
          body: _createUi(context),
        ),
      ),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return DrawerSlideController(
      screenIndex: drawerIndex,
      drawerWidth: MediaQuery.of(context).size.width * 0.75,
      onDrawerCall: (DrawerIndex drawerIndexdata) {
        changeIndex(drawerIndexdata);
        //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
      },
      screenView: screenView,
      //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = Page1();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = Page1();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = Page1();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = Page1();
        });
      } else {
        //do in your way......
      }
    }
  }
}

class Page1 extends StatelessWidget {
  bool multiple = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          appBar(),
        ],
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: getTxtBlackColor(
                  msg: 'Flutter UI',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: ColorConst.BLACK_COLOR,
                  ),
                  onTap: () {
                    // setState(() {
                    //   multiple = !multiple;
                    // }
                    // );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
