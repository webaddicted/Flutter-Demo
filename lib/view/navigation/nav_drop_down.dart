import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/example/calculator_app.dart';
import 'dart:math';
class NavigDropDown extends StatefulWidget {
  @override
  _NavigDropDownState createState() => _NavigDropDownState();
}

class _NavigDropDownState extends State<NavigDropDown> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: viewContainer,
    );
  }

  Widget viewContainer(BuildContext context, BoxConstraints boxconstraints) {
    return Stack(
      children: <Widget>[
        _backView(context),
        GuillotineMenu()
      ],
    );
  }


  Widget _backView(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color.fromRGBO(39, 32, 48, 1.0), //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(

      body: Container(
        child: Center(
          child: Text("Hello World",
            style: TextStyle(
                fontSize: 32.0
            ),),
        ),
      ),
    );

  }
}
class GuillotineMenu extends StatefulWidget {
  @override
  _GuillotineMenuState createState() => _GuillotineMenuState();
}

class _GuillotineMenuState extends State<GuillotineMenu>
    with SingleTickerProviderStateMixin {
  final GlobalKey _menuIconkey = GlobalKey();

  final Color _menuBg = Color.fromRGBO(76, 63, 92, 1.0);

  Animation<double> _menuAnimation;

  Animation<double> _toolbarTitleFadeAnimation;

  AnimationController _guillotineMenuAnimationController;

  @override
  void initState() {
    super.initState();

/*
This is to check the offset of the menu Icon in top left corner.
    // WidgetsBinding.instance.addPostFrameCallback(_getPosition);
*/

    _guillotineMenuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    )..addListener(() {
      setState(() {});
    });

    // Menu Animation

    _menuAnimation = Tween(begin: -pi / 2, end: 0.0).animate(CurvedAnimation(
        parent: _guillotineMenuAnimationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn));

    // Toolbar Title Transition

    _toolbarTitleFadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_guillotineMenuAnimationController);
  }

  _getPosition(_) {
    _getOffset();
  }

  void _getOffset() {
    final RenderBox offsetBox = _menuIconkey.currentContext.findRenderObject();
    final Offset offset = offsetBox.localToGlobal(Offset.zero);
    print("Offset : $offset");
  }

  @override
  void dispose() {
    super.dispose();
    _guillotineMenuAnimationController.dispose();
  }

  void _onMenuIconClick() {
    if (_isMenuVisible()) {
      _guillotineMenuAnimationController.reverse();
    } else {
      _guillotineMenuAnimationController.forward();
    }
  }

  bool _isMenuVisible() {
    final AnimationStatus status = _guillotineMenuAnimationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _menuAnimation.value,
      origin: Offset(32.0, 50.0),
      alignment: Alignment.topLeft,
      child: Material(
        color: _menuBg,
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _toolbar(),
                ),
                Expanded(
                  flex: 8,
                  child: _menuItems(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolbar() {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        // padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: <Widget>[_toolbarIcon(), _toolbarTitle()],
        ),
      ),
    );
  }

  Widget _toolbarIcon() {
    return IconButton(
      key: _menuIconkey,
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () => _onMenuIconClick(),
    );
  }

  Widget _toolbarTitle() {
    return FadeTransition(
      opacity: _toolbarTitleFadeAnimation,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Text(
          "Activity",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _menuItems() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: Text(
              "PROFILE",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.rss_feed,
              color: Colors.white,
            ),
            title: Text(
              "FEED",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.local_activity,
              color: Colors.white,
            ),
            title: Text(
              "ACTIVITY",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              "SETTINGS",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}