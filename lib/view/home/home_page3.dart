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

class HomePage3 extends StatefulWidget {
  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
             getUsers()
            ],
          ),
        ),
      ),
    );
  }

  Widget getUsers() {
    return  Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(top: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyImgList.length,
        itemBuilder: (BuildContext context, int index) {
          return _categoryList(context, index);
        },
      ),
    );
  }
  Widget _categoryList(BuildContext context, int index) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image: DecorationImage(
                    image: NetworkImage(dummyImgList[index]), fit: BoxFit.cover)),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Index $index")
        ],
      ),
    );
  }
}
