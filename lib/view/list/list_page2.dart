import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/book_tiles.dart';
import 'package:flutterbeginner/view/widgets/sifi_movie_row.dart';
import 'package:flutterbeginner/view/widgets/tranding_movie_row.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_indicator/page_indicator.dart';

class ListPage2 extends StatefulWidget {
  @override
  _ListPage2State createState() => _ListPage2State();
}

class _ListPage2State extends State<ListPage2> {
  BuildContext ctx;
  PageController pageController =
  PageController(viewportFraction: 1, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
        getAppBarWithBackBtn(ctx: context, title: StringConst.MOVIE_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return SafeArea(
      child: Container(
        color: ColorConst.GREY_BG_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getViewPager(),
              SizedBox(height: 10),
              getBooksList(),

              SifiMovieRow("Sci-fi Movies"),
              TrandingMovieRow(
                dummyImg: AssetsConst.BG_GIRL_IMG,
                animationName: "Category",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCate() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        getHeading(StringConst.CATEGORY),
        SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: Container(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return getCatRow();
                }),
          ),
        ),
      ],
    );
  }

  Widget getCatRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                loadCircleImg(ApiConstant.DEMO_IMG, 0, 80),
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                    height: 80,
                    width: 80,
                    color: ColorConst.BLACK_FADE,
                  ),
                )
              ],
            ),
            getTxtBlackColor(msg: StringConst.SIFI, fontWeight: FontWeight.w700)
          ],
        ),
      ),
    );
  }

  Widget getHeading(String heading) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getTxtBlackColor(
              msg: heading, fontSize: 19, fontWeight: FontWeight.w700),
          GestureDetector(
            onTap: () {},
            child: getTxtColor(
                msg: StringConst.VIEW_ALL,
                txtColor: Colors.blue,
                fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }

  Widget getBooksList() {
    return Container(
      height: 200,
      child: ListView.builder(
          itemCount: dummyPopulateImg.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return BooksTile(
              imgAssetPath: dummyPopulateImg[index],
              rating: 3,
              title: "The little mermaid",
              description: StringConst.DUMMY_TEXT,
              categorie: "Fairy Tailes",
            );
          }),
    );
  }

  Widget getViewPager() {
    return Container(
      height: 220.0,
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        length: dummyImgList
            .take(5)
            .length,
        indicatorSpace: 8.0,
        padding: const EdgeInsets.all(5.0),
        indicatorColor: ColorConst.APP_COLOR,
        indicatorSelectorColor: ColorConst.WHITE_COLOR,
        shape: IndicatorShape.circle(size: 5.0),
        child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: dummyImgList
              .take(5)
              .length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: dummyImgList[index],
                    child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 220.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(dummyImgList[index])),
                        )),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                            0.0,
                            0.9
                          ],
                          colors: [
                            ColorConst.BLACK_COLOR.withOpacity(1.0),
                            ColorConst.BLACK_COLOR.withOpacity(0.0)
                          ]),
                    ),
                  ),
                  Positioned(
                      bottom: 0.0,
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Icon(
                        FontAwesomeIcons.playCircle,
                        color: ColorConst.APP_COLOR,
                        size: 40.0,
                      )),
                  Positioned(
                      bottom: 30.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: 250.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Image$index',
                              style: TextStyle(
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
