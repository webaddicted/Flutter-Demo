import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_arc_page2.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_fab_zoom_out.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_fade_appbar.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_page3.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_zoom_img_page2.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapsetoolbar_page1.dart';
import 'package:flutterbeginner/view/collapsetoolbar/wave_appbar.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class CollapseToolbarPage extends StatelessWidget {
  List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.LIST_DESIGN_TITLE),
      body: HomeItemWidget(
        dataBean: collapseToolbarItem,
        onTap: (screenName, page) => navigationPush(context, page),
      ),
    );
  }
}
