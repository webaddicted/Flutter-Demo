import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage6 extends StatefulWidget {
  @override
  _HomePage6State createState() => _HomePage6State();
}

class _HomePage6State extends State<HomePage6>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.cyanAccent,
            title: Text(StringConst.APP_NAME),
            bottom: PreferredSize(
              child: _buildHeader(),
              preferredSize: const Size.fromHeight(90),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              )
            ],
          ),
          _buildHeading("Utility Payments"),
          _buildUtilityPaymentsGrid(),
          _buildDivider(),
          _buildHeading("Bookings"),
          _buildBookingsGrid(),
          _buildDivider(height: 8.0),
        ],
      ),
    );
  }

  SliverPadding _buildBookingsGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 16.0, mainAxisSpacing: 16.0),
        delegate: SliverChildBuilderDelegate((_, index) {
          HomeMenuItem item = homeBookingsItems[index];
          return _buildMenuItem(
              icon: item.icon, label: item.title, subtitle: item.subtitle);
        }, childCount: homeBookingsItems.length),
      ),
    );
  }

  SliverPadding _buildUtilityPaymentsGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 16.0, mainAxisSpacing: 16.0),
        delegate: SliverChildBuilderDelegate((_, index) {
          HomeMenuItem item = homeMenuItems[index];
          return _buildMenuItem(
              icon: item.icon, label: item.title, subtitle: item.subtitle);
        }, childCount: homeMenuItems.length),
      ),
    );
  }

  MaterialButton _buildBottomMenuItem(
      {Widget icon, String label, Function onTap}) {
    return MaterialButton(
      height: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          Text(
            label,
            style: TextStyle(fontSize: 9),
          )
        ],
      ),
      onPressed: onTap,
    );
  }

  Widget _buildHeading(String title) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          child: Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider({Color color, double height = 4.0}) {
    if (color == null) color = Colors.cyanAccent.shade100;
    return SliverToBoxAdapter(
      child: Container(
        height: height,
        color: color,
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      height: 100.0,
      width: double.infinity,
      color: Colors.cyanAccent.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          _buildHeaderItem(icon: FontAwesomeIcons.wallet, label: "Load Fund"),
          Spacer(),
          _buildHeaderItem(
              icon: FontAwesomeIcons.mobileAlt, label: "Send/Request"),
          Spacer(),
          _buildHeaderItem(icon: FontAwesomeIcons.qrcode, label: "Scan & Pay"),
          Spacer(),
          _buildHeaderItem(
              icon: FontAwesomeIcons.coins, label: "Bank Transfer"),
          Spacer(),
        ],
      ),
    );
  }

  Column _buildHeaderItem({IconData icon, String label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            icon,
            size: 30,
            color: Colors.cyanAccent.shade400,
          ),
        ),
        const SizedBox(height: 5.0),
        getTxtBlackColor(msg: label),
      ],
    );
  }

  Widget _buildMenuItem({IconData icon, String label, String subtitle}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'payment');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 28,
            color: Colors.cyanAccent.shade400,
          ),
          const SizedBox(height: 10.0),
          getTxtBlackColor(msg: label),
          if (subtitle != null) const SizedBox(height: 5.0),
          if (subtitle != null)
            Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 4.0,
                ),
                color: Colors.grey.shade200,
                child: getTxtBlackColor(
                    msg: subtitle, textAlign: TextAlign.center))
        ],
      ),
    );
  }

  final List<HomeMenuItem> homeMenuItems = [
    HomeMenuItem("Topup", FontAwesomeIcons.mobileAlt, subtitle: "CASHBACK 2%"),
    HomeMenuItem("RC Card", FontAwesomeIcons.addressCard,
        subtitle: "CASHBACK 2-3%"),
    HomeMenuItem("Landline", FontAwesomeIcons.intercom,
        subtitle: "CASHBACK 2%"),
    HomeMenuItem("Electricity", FontAwesomeIcons.idBadge),
    HomeMenuItem("Khanepani", FontAwesomeIcons.water),
    HomeMenuItem("TV", FontAwesomeIcons.tv, subtitle: "CASHBACK 2%"),
    HomeMenuItem("Internet", FontAwesomeIcons.globe,
        subtitle: "CASHBACK 0.5-5%"),
    HomeMenuItem("E-Learning", FontAwesomeIcons.readme,
        subtitle: "CASHBACK 2%"),
    HomeMenuItem("Antivirus", FontAwesomeIcons.shieldAlt,
        subtitle: "CASHBACK 30%"),
    HomeMenuItem("Insurance", FontAwesomeIcons.userShield),
    HomeMenuItem("Ride", FontAwesomeIcons.motorcycle, subtitle: "CASHBACK 5%"),
    HomeMenuItem("Share", FontAwesomeIcons.shareSquare),
    HomeMenuItem("Newspaper", FontAwesomeIcons.newspaper),
    HomeMenuItem("Credit Card", FontAwesomeIcons.creditCard),
  ];
  final List<HomeMenuItem> homeBookingsItems = [
    HomeMenuItem("Flight", FontAwesomeIcons.plane),
    HomeMenuItem("Movie", FontAwesomeIcons.ticketAlt, subtitle: "CASHBACK 2%"),
    HomeMenuItem("Hotel", FontAwesomeIcons.hotel),
    HomeMenuItem("Event", FontAwesomeIcons.calendarCheck)
  ];
}

class HomeMenuItem {
  final IconData icon;
  final String title;
  final String subtitle;

  HomeMenuItem(this.title, this.icon, {this.subtitle});
}
