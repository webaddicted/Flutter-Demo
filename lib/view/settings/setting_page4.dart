import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingPage4 extends StatefulWidget {
  @override
  _SettingPage4State createState() => _SettingPage4State();
}

class _SettingPage4State extends State<SettingPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx: context, title: 'Setting Page4'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
          ),
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              profileDetail(),
              SizedBox(height: 30.0),
              profileCategories(),
              SizedBox(height: 30.0),
              profileMenu()
            ],
          ),
        ),
      ),
    );
  }

  Widget profileDetail() {
    Size deviceSize = MediaQuery.of(context).size;
    const List profileItems = [
      {'count': '846', 'name': 'Collect'},
      {'count': '51', 'name': 'Attention'},
      {'count': '267', 'name': 'Track'},
      {'count': '39', 'name': 'Coupons'},
    ];
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      elevation: 10.0,
      child: Container(
        height: deviceSize.height * 0.2,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Color(0xFF3775FD),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                loadCircleImg(ApiConstant.WEBADDICTED_IMG, 0, 60),
                SizedBox(width: 15.0),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Mausam Rayamajhi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.border_color,
                          color: Colors.white,
                          size: 15.0,
                        )
                      ],
                    ),
                    Text(
                      'A trendsetter',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var item in profileItems)
                  Column(
                    children: <Widget>[
                      Text(
                        item['count'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        item['name'],
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Catg> listProfileCategories = [
    Catg(name: 'Wallet', icon: FontAwesomeIcons.wallet, number: 0),
    Catg(name: 'Delivery', icon: FontAwesomeIcons.truck, number: 0),
    Catg(name: 'Message', icon: FontAwesomeIcons.snapchat, number: 2),
    Catg(name: 'Service', icon: FontAwesomeIcons.moneyBill, number: 0),
  ];

  Widget profileCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (Catg catg in listProfileCategories)
            categoryRow(
              catg: catg,
            )
        ],
      ),
    );
  }

  categoryRow({Catg catg}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (catg.name == listProfileCategories[0].name)
                  Navigator.pushNamed(context, '/furniture');
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF6F5F8),
                ),
                child: Icon(
                  catg.icon,
                  // size: 20.0,
                ),
              ),
            ),
            catg.number > 0
                ? Positioned(
                    right: -5.0,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF3775FD),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        catg.number.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          catg.name,
          style: TextStyle(
            fontSize: 13.0,
          ),
        )
      ],
    );
  }

  List<ProfileMenu> profileMenuList = [
    ProfileMenu(
      title: 'Address',
      subTitle: 'Ensure your harvesting address',
      iconColor: Color(0xFF8D7AEE),
      icon: Icons.location_on,
    ),
    ProfileMenu(
      title: 'Privacy',
      subTitle: 'System permission change',
      iconColor: Color(0xFFF369B7),
      icon: Icons.lock,
    ),
    ProfileMenu(
      title: 'General',
      subTitle: 'Basic functional settings',
      iconColor: Color(0xFFFFC85B),
      icon: Icons.layers,
    ),
    ProfileMenu(
      title: 'Notification',
      subTitle: 'Take over the news in time',
      iconColor: Color(0xFF5DD1D3),
      icon: Icons.notifications,
    ),
  ];

  profileMenu() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        for (var menu in profileMenuList)
          menuItem(
            menu: menu,
          ),
      ],
    );
  }

  menuItem({ProfileMenu menu}) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: deviceSize.height * 0.09,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD1DCFF),
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: menu.iconColor,
                  ),
                  child: Icon(
                    menu.icon,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        menu.title,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        menu.subTitle,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFFC4C5C9),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xFFC4C5C9),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileMenu {
  String title;
  String subTitle;
  IconData icon;
  Color iconColor;

  ProfileMenu({this.icon, this.title, this.iconColor, this.subTitle});
}

class Catg {
  String name;
  IconData icon;
  int number;

  Catg({this.icon, this.name, this.number});
}
