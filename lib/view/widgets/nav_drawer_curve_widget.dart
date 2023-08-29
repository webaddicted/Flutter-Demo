import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/oval-right-clipper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class NavDrawerCurveWidgt extends StatelessWidget {
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
              color: ColorConst.whiteColor,
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
                          Icons.close,
                        ),
                        onPressed: () => Navigator.of(_context).pop()),
                  ),
                  InkWell(
                    onTap: ()=>_navigateOnNextScreen('Profile'),
                    child: Container(
                      height: 128,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            ColorConst.greenColor,
                            ColorConst.appColor
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
                      txtColor: ColorConst.blackColor),
                  const SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home"),
                  _buildDivider(),
                  _buildRow(Icons.category, "Category"),
                  _buildDivider(),
                  _buildRow(Icons.local_movies, "Tranding Movie",
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.movie_filter, "Popular Movie",
                      showBadge: false),
                  _buildDivider(),
                  _buildRow(Icons.movie, "Upcoming Movie", showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Profile"),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Settings"),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us"),
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
      color: ColorConst.greyColor,
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
            color: ColorConst.blackColor,
          ),
          const SizedBox(width: 10.0),
          getTxtColor(
            msg: title,
            txtColor: ColorConst.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
          const Spacer(),
          if (showBadge)
            Material(
              color: ColorConst.appColor,
              elevation: 2.0,
              // shadowColor: ColorConst.APP_COLOR,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 10,
                height: 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorConst.appColor,
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
      case "Category":
        break;
      case "Profile":
        break;
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
