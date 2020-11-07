import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/oval-right-clipper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/api/api_call_page.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page.dart';
import 'package:flutterbeginner/view/login/login_page.dart';
import 'package:flutterbeginner/view/navigation/navigation_page.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page.dart';
import 'package:flutterbeginner/view/splash/splash_page.dart';
import 'package:flutterbeginner/view/tabbar/tabbar_page.dart';

class NavDrawerHome extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return _buildDrawer();
  }

  _buildDrawer() {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: ColorConst.WHITE_COLOR,
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        icon: Icon(
                          Icons.close,
                        ),
                        onPressed: () => Navigator.of(_context).pop()),
                  ),
                  InkWell(
                    onTap: () => _navigateOnNextScreen('Profile'),
                    child: Container(
                      height: 128,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            ColorConst.GREEN_COLOR,
                            ColorConst.APP_COLOR
                          ])),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(ApiConstant.DEMO_IMG),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  getTxtBlackColor(
                    msg: StringConst.DEEPAK_SHARMA,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  getTxtColor(
                      msg: StringConst.WEBADDICTED,
                      fontSize: 16,
                      txtColor: ColorConst.BLACK_COLOR),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home"),
                  _buildDivider(),
                  _buildRow(Icons.category, "Splash"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "OnBoarding"),
                  _buildDivider(),
                  _buildRow(Icons.category, "Login UI Design"),
                  _buildDivider(),
                  _buildRow(Icons.local_movies, "API Calling Architecture",
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.movie_filter, "Navigation Drawer",
                      showBadge: false),
                  _buildDivider(),
                  _buildRow(Icons.movie, "Bottom Navigation", showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Tab Bar"),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Settings"),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us"),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "About us"),
                  _buildDivider(),
                  _buildRow(Icons.exit_to_app, "Exit"),
                  _buildDivider(),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: ColorConst.GREY_COLOR,
    );
  }

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () => _navigateOnNextScreen(title),
        child: Row(children: [
          Icon(
            icon,
            color: ColorConst.BLACK_COLOR,
          ),
          SizedBox(width: 10.0),
          getTxtColor(
              msg: title,
              txtColor: ColorConst.BLACK_COLOR,
              fontSize: 16,
              fontWeight: FontWeight.w600),
          Spacer(),
          if (showBadge)
            Material(
              color: ColorConst.APP_COLOR,
              elevation: 2.0,
              // shadowColor: ColorConst.APP_COLOR,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 10,
                height: 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConst.APP_COLOR,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                // child: Text(
                //   "10+",
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 12.0,
                //       fontWeight: FontWeight.bold),
                // ),
              ),
            )
        ]),
      ),
    );
  }

  void _navigateOnNextScreen(String title) {
    Navigator.of(_context).pop();
    switch (title) {
      case "Home":
        // navigationPush(_context, CategoryMovie());
        break;
      case "Splash":
        return navigationPush(_context, SplashPage());
      case "Login UI Design":
        return navigationPush(_context, LoginPage());
      case "API Calling Architecture":
        return navigationPush(_context, ApiCallPage());
      case "Navigation Drawer":
        return navigationPush(_context, NavigationPage());
      case "Bottom Navigation":
        return navigationPush(_context, BottomNavPage());
      case "Tab Bar":
        return navigationPush(_context, TabBarPage());
      case "OnBoarding":
        return navigationPush(_context, OnboardingPage());
      // case "Settings":
      //   break;
      // case "Settings":
      //   break;
      case "Settings":
        break;
      case "Contact us":
        break;
      case "About us":
        break;
      case "Exit":
        onWillPop(_context);
        break;
    }
  }
}
