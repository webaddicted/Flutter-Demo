import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/view/alltask/code_preview.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class SubTitlePage extends StatelessWidget {
  TaskItem subItem;

  SubTitlePage(this.subItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx: context, title: subItem.title),
      body: HomeItemWidget(
        dataBean: subItem.subItem,
        onTap: (TaskItem taskItem) => navigationPush(context, taskItem.page),
        onlongPress: (TaskItem taskItem) {
          optionMenu(context, taskItem);
        },
      ),
    );
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
                  GestureDetector(
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