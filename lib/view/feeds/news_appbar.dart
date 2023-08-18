import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/feeds/discover/discover.dart';
import 'package:flutterbeginner/view/feeds/discover/interest_screen.dart';

class NewsCardAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        // color: Colors.white,
        child: Container(
          height: 52,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      navigationPush(context, DiscoverScreen());
                    },
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_left),
                              color: ColorConst.GREY_COLOR,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              "Search",
                              // style: AppTextStyle.appBarTitle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  // Consumer<FeedProvider>(
                  //   builder: (context, value, child) =>
                  //       value.getCurentArticalIndex != 0
                  //           ?
                        IconButton(
                                icon: Icon(Icons.arrow_circle_up_rounded),
                                onPressed: () {
                                  navigationPush(context, InterestScreen());

                                  // value.getfeedPageController.animateToPage(0,
                                  //     duration: Duration(milliseconds: 700),
                                  //     curve: Curves.easeInBack);
                                })
                            // : Container(),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
