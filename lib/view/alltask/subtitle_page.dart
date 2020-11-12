import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/view/alltask/code_preview.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class SubTitlePage extends StatelessWidget {
  TaskItem subItem;
  bool isGrid = true;

  SubTitlePage(this.subItem);

  @override
  Widget build(BuildContext context) {
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

  getGridView() {
    return Container(
        color: ColorConst.GREY_BG_COLOR,
        alignment: Alignment.center,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(4.0),
          itemCount: subItem.subItem.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0 / 1.1, //width/height
          ),
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
                  child: Column(
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
                ),
              ),
            );
          },
        ));
  }
}

optionMenu(BuildContext context, TaskItem taskItem) {
  showDialog(
      context: context,
      child: new AlertDialog(
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
                        ));
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: getTxtBlackColor(msg: 'Code Preview'))),
            ],
          ))));
}
