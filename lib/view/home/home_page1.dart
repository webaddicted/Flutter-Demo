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

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context,
          title: StringConst.HOME_TITLE,
          bgColor: ColorConst.WHITE_COLOR,
          txtColor: ColorConst.BLACK_COLOR,
          actions: [buildAvatar(context)]),
      body: _createUi(),
    );
  }
  Widget buildAvatar(BuildContext context) {
    return IconButton(
      iconSize: 40,
      padding: EdgeInsets.all(0),
      icon: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: loadLocalCircleImg(AssetsConst.DEEPAK_IMG, 30),
      ),
      onPressed: () {},
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
              // SizedBox(height:450,child: ShimmerView.movieDetailsTag()),
              SizedBox(
                  height: 180, width: double.infinity, child: CarouselView()),
              SizedBox(height: 10),
              getHeading(context, 'Category'),
              SizedBox(height: 10),
              movieCate(),
              scrollItem(),
              TrandingMovieRow(),
              listWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget movieCate() {
    return SizedBox(
      height: 150,
      child: Container(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dummyLargeImg.length,
            itemBuilder: (BuildContext context, int index) {
              return getCatRow(context, index, dummyLargeImg[index]);
            }),
      ),
    );
  }

  Widget getCatRow(BuildContext context, int index, String item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                loadCircleImg(item, 0, 100),
                Positioned.fill(
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            splashColor: Colors.redAccent, onTap: () {}))),
              ],
            ),
            getTxtBlackColor(msg: 'Item $index', fontWeight: FontWeight.w700)
          ],
        ),
      ),
    );
  }

  Widget scrollItem() {
    return Card(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.indigo,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: dummyImgList.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Buy, Sell, Exchange",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      "All in one place",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
                loadCircleImg(dummyImgList[index], 0, 120),
                const SizedBox(width: 20.0),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget listWidget() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: dummyImgList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListWidget();
        },
      ),
    );
  }
}
