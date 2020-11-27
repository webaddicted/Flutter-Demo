import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/view/alltask/code_preview.dart';
import 'package:flutterbeginner/view/widgets/all_item_widget.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class SubTitlePage extends StatelessWidget {
  TaskItem subItem;
  bool isGrid = true;

  BuildContext ctx;


  SubTitlePage(this.subItem);

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx: context, title: subItem.title),
      body: isGrid
          ? getGridView()
          : HomeItemWidget(
              dataBean: subItem.subItem,
              onTap: (TaskItem taskItem) =>
                  navigationPush(context, taskItem.page),
              onlongPress: (TaskItem taskItem) {
                optionMenu(context, taskItem);
              },
            ),
    );
  }
  // final key = GlobalKey();
  getGridView() {
    return Container(
        color: ColorConst.GREY_BG_COLOR,
        alignment: Alignment.center,
        child: GridView.builder(
          // key: key,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(4.0),
          itemCount: subItem.subItem.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2.5 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          // SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   childAspectRatio: 1.0 / 1.1, //width/height
          // ),
          itemBuilder: (context, index) {
            TaskItem taskItem = subItem.subItem[index];
            return InkWell(
              onLongPress: () {
                optionMenu(context, taskItem);
              },
              onTap: () {
                navigationPush(context, taskItem.page);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {
                              optionMenu(context, taskItem);
                            }),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundColor: Colors.primaries[
                                  Random().nextInt(Colors.primaries.length)],
                              radius: 35.0,
                              child: getTxtWhiteColor(
                                  msg: taskItem.title[0].toUpperCase(),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)),
                          Padding(padding: EdgeInsets.only(left: 8)),
                          const SizedBox(height: 5.0),
                          getTxtBlackColor(
                              msg: taskItem.title,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center),
                          getTxtGreyColor(
                              msg: StringConst.DUMMY_TEXT,
                              fontSize: 15,
                              maxLines: 3,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  // void clickPopMenu() {
  //   PopupMenuButton(
  //     icon: Icon(Icons.settings),
  //     onSelected: (newValue) { // add this property
  //     },
  //     itemBuilder: (context) => [
  //       PopupMenuItem(
  //         child: Text("Settings"),
  //         value: 0,
  //       ),
  //       PopupMenuItem(
  //         child: Text("Flutter.io"),
  //         value: 1,
  //       ),
  //       PopupMenuItem(
  //         child: Text("Google.com"),
  //         value: 2,
  //       ),
  //     ],
  //   );
  // }
}

optionMenu(BuildContext context, TaskItem taskItem) {
  showDialog(
      context: context,
      child: new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
          title: getTxtBlackColor(
              msg: 'Select Option', fontWeight: FontWeight.bold),
          content: Container(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    navigationPush(
                        context,
                        CodePreviewsPage(
                          title: taskItem.title,
                          path: taskItem.codePreview,
                          item: taskItem,
                        ));
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: getTxtBlackColor(msg: 'Code Preview'))),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    try {
                      shareText(taskItem);
                    } catch (e) {
                      print('error: $e');
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: getTxtBlackColor(msg: 'Share'))),
            ],
          ))));
}
