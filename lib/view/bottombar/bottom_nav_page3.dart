// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/widgets/tab_item.dart';

class BottomNavPage3 extends StatefulWidget {
  const BottomNavPage3({super.key});

  @override
  State<BottomNavPage3> createState() => _BottomNavPage3State();
}

class _BottomNavPage3State extends State<BottomNavPage3> {
  int selectedPosition = 0;
  final tabs = ['Profile', 'Share', 'Rating', 'Contact'];
  bool isHomeSelected = true;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_NAVIGATION_TITLE),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isHomeSelected = true;
            });
          },
          child: Icon(Icons.home_filled,
              color: isHomeSelected ? ColorConst.appColor : Colors.grey)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomTab(),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    return getPage(selectedPosition);
  }

  Widget buildBottomTab() {
    return BottomAppBar(
      color: ColorConst.appColor,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(
              text: tabs[0],
              icon: Icons.supervised_user_circle,
              isSelected: selectedPosition == 0,
              isHomeSelected: isHomeSelected,
              onTap: () {
                isHomeSelected = false;
                setState(() {
                  selectedPosition = 0;
                });
              }),
          TabItem(
              text: tabs[1],
              icon: Icons.share_rounded,
              isHomeSelected: isHomeSelected,
              isSelected: selectedPosition == 1,
              onTap: () {
                isHomeSelected = false;
                setState(() {
                  selectedPosition = 1;
                });
              }),
          const SizedBox(width: 48),
          TabItem(
              text: tabs[2],
              icon: Icons.feedback_outlined,
              isHomeSelected: isHomeSelected,
              isSelected: selectedPosition == 2,
              onTap: () {
                isHomeSelected = false;
                setState(() {
                  selectedPosition = 2;
                });
              }),
          TabItem(
              text: tabs[3],
              icon: Icons.contact_support_outlined,
              isHomeSelected: isHomeSelected,
              isSelected: selectedPosition == 3,
              onTap: () {
                isHomeSelected = false;
                setState(() {
                  selectedPosition = 3;
                });
              }),
        ],
      ),
    );
  }

  Widget getPage(int page) {
    switch (page) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("This is the home page"),
            MaterialButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: const Text("Start new page",
                    style: TextStyle(color: Colors.white))),
            MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {},
                child: const Text("Change to page 3",
                    style: TextStyle(color: Colors.white)))
          ],
        );
      case 1:
        return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          const Text("This is the search page"),
          MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: const Text("Start new page",
                  style: TextStyle(color: Colors.white)))
        ]);
      default:
        return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          const Text("This is the basket page"),
          MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: const Text("Start new page",
                  style: TextStyle(color: Colors.white)))
        ]);
    }
  }
}
