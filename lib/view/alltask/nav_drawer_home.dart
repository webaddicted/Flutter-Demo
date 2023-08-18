import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/oval-right-clipper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/sp/sp_manager.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/alltask/subtitle_page.dart';
import 'package:flutterbeginner/view/example/about_us_screen.dart';
import 'package:flutterbeginner/view/example/invite_friend_screen.dart';

class NavDrawerHome extends StatelessWidget {
  late BuildContext _context;

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
          decoration: const BoxDecoration(
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
                        icon: const Icon(
                          Icons.close
                        ),
                        onPressed: () => Navigator.of(_context).pop()),
                  ),
                  InkWell(
                    onTap: () => _navigateOnNextScreen('Profile'),
                    child: Container(
                      height: 128,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            ColorConst.GREEN_COLOR,
                            ColorConst.APP_COLOR
                          ])),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(ApiConstant.DEMO_IMG),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  getTxtBlackColor(
                    msg: StringConst.DEEPAK_SHARMA,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  getTxtColor(
                      msg: StringConst.WEBADDICTED,
                      fontSize: 16,
                      txtColor: ColorConst.BLACK_COLOR),
                  const SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home"),
                  _buildDivider(),
                  _buildRow(Icons.category, "Splash"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "OnBoarding UI Design"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Login UI Design"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Home UI Design"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Profile UI Design"),
                  _buildDivider(),
                  _buildRow(Icons.category, "Details UI Design"),
                  _buildDivider(),
                  _buildRow(Icons.category, "Setting UI Design"),
                  _buildDivider(),
                  _buildRow(Icons.category, "List UI Design"),
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
                  _buildRow(Icons.person_pin, "Start From beginning"),
                  _buildDivider(),
                  _buildRow(Icons.email, "Invite Friend"),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "About us"),
                  _buildDivider(),
                  _buildRow(Icons.exit_to_app, "Exit"),
                  _buildDivider(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return const Divider(
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
          const SizedBox(width: 10.0),
          getTxtColor(
              msg: title,
              txtColor: ColorConst.BLACK_COLOR,
              fontSize: 16,
              fontWeight: FontWeight.w600),
          const Spacer(),
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
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Splash', subItem: splashPageItem)));
      case "OnBoarding UI Design":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'OnBoarding UI Design', subItem: onboardingPageItem)));
      case "Login UI Design":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Login UI Design', subItem: loginPageItem)));
      case "Home UI Design":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Home UI Design', subItem: homeItem)));
      case "Profile UI Design":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Profile UI Design', subItem: profileItem)));
      case "Details UI Design":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Details UI Design', subItem: detailsItem)));
      case "Setting UI Design":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Setting UI Design', subItem: settingPageItem)));
      case "List UI Design":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'List UI Design', subItem: listPageItem)));
        case "API Calling Architecture":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'API Calling Architecture', subItem: apiCallItem)));
      case "Navigation Drawer UI":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Navigation Drawer UI', subItem: navPageItem)));
      case "Bottom Navigation":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Bottom Navigation', subItem: bottomNavItem)));
      case "Tab Bar":
        return navigationPush(_context, SubTitlePage(TaskItem(title: 'Tab Bar', subItem: tabBarPageItem)));
      case 'Start From beginning':
        SPManager.setOnboarding(false);
        break;
      case "Invite Friend":
        return navigationPush(_context, InviteFriend());
      case "About us":
        return navigationPush(_context, AboutUsScreen());
      case "Exit":
        onWillPop(_context);
        break;
    }
  }
}
