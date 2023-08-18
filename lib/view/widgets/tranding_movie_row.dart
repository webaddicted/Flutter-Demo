import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_fab_zoom_out.dart';

class TrandingMovieRow extends StatelessWidget {
  String? animationName;
  String? dummyImg;
  List<String>? data;
  TrandingMovieRow({this.dummyImg, this.animationName, List<String>? data});

  @override
  Widget build(BuildContext context) {
    return getTradingList(context);
  }

  Widget getTradingList(BuildContext context) {
    int? count = (data ?? dummyPopulateImg.length) as int?;
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        if (animationName != null) getHeading(context, animationName!),
        const SizedBox(height: 10),
        SizedBox(
          height: 190.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: count,
            itemBuilder: (context, index) {
              var item = data!=null ?data![index]:dummyPopulateImg[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {
                    navigationPush(context, CollapseFabZoomOut());
//                  Navigator.push(context, MaterialPageRoute(
//                      builder: (context) => DetailsMovieScreen(AssetsConst.PIZZA_IMG)
//                  ));
                  },
                  child: Hero(
                    tag: animationName!=null? animationName! + index.toString():'Test _ $index',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: dummyImg != null
                          ? Image.asset(
                              dummyImg??"",
                              fit: BoxFit.cover,
                              width: 125,
                            )
                          : Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: 125,
                            ),
                    ),
                  ),
                ),
//                tag: AssetsConst.PIZZA_IMG,
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget getHeading(BuildContext context, String heading) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        getTxtBlackColor(
            msg: heading, fontSize: 19, fontWeight: FontWeight.w700),
        GestureDetector(
          onTap: () {
//            navigationPush(context, MovieListScreen());
          },
          child: getTxtColor(
              msg: StringConst.VIEW_ALL,
              txtColor: Colors.blue,
              fontWeight: FontWeight.w800),
        )
      ],
    ),
  );
}
