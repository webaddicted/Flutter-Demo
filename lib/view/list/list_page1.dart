import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/carousel_view.dart';
import 'package:flutterbeginner/view/widgets/list_widget.dart';
import 'package:flutterbeginner/view/widgets/tranding_movie_row.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListPage1 extends StatefulWidget {
  @override
  _ListPage1State createState() => _ListPage1State();
}

class _ListPage1State extends State<ListPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context,
          title: StringConst.HOME_TITLE),
      body: _createUi(),
    );
  }

  Widget _createUi() {
    return SafeArea(
      child: Container(
        color: ColorConst.GREY_BG_COLOR,
        child:  ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: dummyImgList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListWidget();
          },
        ),
      ),
    );
  }
}
