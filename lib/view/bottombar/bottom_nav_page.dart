import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class BottomNavPage extends StatelessWidget {
  List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.BOTTOM_NAV_DESIGN_TITLE),
      body: HomeItemWidget(
        dataBean: bottomNavItem,
        onTap: (screenName, page) => navigationPush(context, page),
      ),
    );
  }
}
