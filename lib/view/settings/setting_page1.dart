import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class SettingPage1 extends StatefulWidget {
  @override
  _SettingPage1State createState() => _SettingPage1State();
}

class _SettingPage1State extends State<SettingPage1> {
  var pushNoti = false;
  var emailNoti = true;
  var darkMode = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var homeIcon = IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorConst.BLACK_COLOR,
        ),
        onPressed: () => Navigator.pop(context));
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context,
            title: StringConst.WEBADDICTED,
            bgColor: ColorConst.WHITE_COLOR,
            txtColor: ColorConst.BLACK_COLOR,
            icon: homeIcon),
        body: _createUi());
  }

  Widget _createUi() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AssetsConst.DEEPAK_IMG),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getTxtBlackColor(
                          msg: StringConst.DEEPAK_SHARMA,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      getTxtColor(
                          fontSize: 17,
                          msg: StringConst.WEBADDICTED,
                          txtColor: ColorConst.GREY_COLOR)
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          getDivider(),
          ListTile(
            title: getTxtBlackColor(
                msg: "Language", fontSize: 16, fontWeight: FontWeight.bold),
            subtitle: getTxtColor(
                msg: "English US",
                fontSize: 15,
                txtColor: ColorConst.GREY_COLOR),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey.shade400,
            ),
            onTap: () {},
          ),
          getDivider(),
          ListTile(
            title: getTxtBlackColor(
                msg: "Profile Settings",
                fontSize: 16,
                fontWeight: FontWeight.bold),
            subtitle: getTxtColor(
                msg: StringConst.DEEPAK_SHARMA,
                fontSize: 15,
                txtColor: ColorConst.GREY_COLOR),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey.shade400,
            ),
            onTap: () {},
          ),
          getDivider(),
          SwitchListTile(
            title: getTxtBlackColor(
                msg: "Email Notifications",
                fontSize: 16,
                fontWeight: FontWeight.bold),
            subtitle: getTxtColor(
                msg: 'On', fontSize: 15, txtColor: ColorConst.GREY_COLOR),
            value: emailNoti,
            onChanged: (val) {
              emailNoti = !emailNoti;
              changeData();
            },
          ),
          getDivider(),
          SwitchListTile(
            title: getTxtBlackColor(
                msg: "Push Notifications",
                fontSize: 16,
                fontWeight: FontWeight.bold),
            subtitle: getTxtColor(
                msg: 'Off', fontSize: 15, txtColor: ColorConst.GREY_COLOR),
            value: pushNoti,
            onChanged: (val) {
              pushNoti = !pushNoti;
              changeData();
            },
          ),
          getDivider(),
          SwitchListTile(
            title: getTxtBlackColor(
                msg: "Dark Mode",
                fontSize: 16,
                fontWeight: FontWeight.bold),
            subtitle: getTxtColor(
                msg: 'Turn dark mode on/off', fontSize: 15, txtColor: ColorConst.GREY_COLOR),
            value: darkMode,
            onChanged: (val) {
              darkMode = !darkMode;
              // ScopedModel.of<ThemeModel>(context).setTheme(darkMode);
              changeData();
            },
          ),
          getDivider(),
          ListTile(
            title: getTxtBlackColor(
                msg: "Exit", fontSize: 16, fontWeight: FontWeight.bold),
            onTap: () => onWillPop(context),
          ),
          getDivider()
        ],
      ),
    );
  }

  void changeData() {
    setState(() {});
  }
}
