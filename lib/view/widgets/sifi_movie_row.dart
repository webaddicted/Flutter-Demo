import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/tranding_movie_row.dart';

class SifiMovieRow extends StatelessWidget {
  final animationName;

  SifiMovieRow(this.animationName);

  @override
  Widget build(BuildContext context) {
    return getTradingList(context);
  }

  Widget getTradingList(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        getHeading(context, animationName),
        SizedBox(height: 10),
        SizedBox(
          height: 190.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              var item = imgList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                child: GestureDetector(
                  onTap: () {
//                    navigationPush(
//                        context, DetailsMovieScreen(animationName, index));
                  },
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Hero(
                        tag: animationName + index.toString(),
                          child: Container(
                            height: 150,
                            width: size.width - 80,
                            child: ClipRRect(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: getTxtBlackColor(
                              msg: "Grilled Burger", fontSize: 15)),
                    ],
                  )),
              );
            },
          ),
        ),
      ],
    );
  }
}
