import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class InterestScreen extends StatefulWidget {
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _createUi());
  }
  Widget _createUi() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:8.0, top: 15, bottom: 15),
            child: getTxtBlackColor(msg: "Based On Interest", fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Expanded(
            child: ListView.separated(
              // physics: BouncingScrollPhysics(),
              itemCount: 25,//dataBean == null ? 0 : dataBean.length,
              itemBuilder: (BuildContext context, int index) {
                return  taskRow(context, "dataBean[index]");
              },
              separatorBuilder: (BuildContext context, int index) {
                return getDivider();
              },

            ),
          ),
        ],
      ),
    );
  }


  Widget taskRow(BuildContext context, String taskItem) {
    return InkWell(
      onLongPress: () {
        // onlongPress(taskItem);
      },
      // splashColor: Col,
      // onTap: () => onTap(taskItem), //nextScreen(context, screenName),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 3, top: 5, bottom: 5),
        child: new Row(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 70,
                width: 80,
                child: Image.network(
                  ApiConstant.DEMO_IMG,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      getTxtGreyColor(msg: "Music", fontSize: 14),
                      getTxtBlackColor(
                          msg: "taskItem.title",
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      getTxtGreyColor(
                          msg: StringConst.DUMMY_LAGE_TEXT, fontSize: 15),
                      SizedBox(height:3),
                      Row(children: [
                        Icon(Icons.person,size: 15, color: ColorConst.GREY_COLOR),
                        getTxtGreyColor(msg: "Deepak", fontSize: 12),
                        SizedBox(width: 20),
                        getTxtGreyColor(msg: "10 Min read", fontSize: 12),
                        SizedBox(width: 20),
                        Icon(Icons.bookmark_border,size: 15, color: ColorConst.GREY_COLOR),
                        SizedBox(width: 10),
                        Icon(Icons.share,size: 15, color: ColorConst.GREY_COLOR),
                      ],)
                    ],
                  ),
                  // if (taskItem.subItem == null)
                  //   Align(
                  //       alignment: Alignment.topRight,
                  //       child: IconButton(
                  //         iconSize: 40,
                  //         padding: EdgeInsets.all(0),
                  //         icon: CircleAvatar(
                  //           backgroundColor: Colors.grey.shade300.withOpacity(0.4),
                  //           child: Icon(Icons.more_vert),
                  //         ),
                  //         // onPressed: () =>optionMenu(context, taskItem),
                  //       )
                  //   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

