import 'dart:math';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/view/alltask/code_preview.dart';
import 'package:flutterbeginner/view/alltask/subtitle_page.dart';
import 'package:flutterbeginner/view/example/swipe_to_delete.dart';

class AllItemWidget extends StatelessWidget {
  final List<TaskItem> dataBean;
  final Function onTap;
  final Function onlongPress;

  AllItemWidget(
      {@required this.dataBean, @required this.onTap, this.onlongPress});

  @override
  Widget build(BuildContext context) {
    return _createUi();
  }

  Widget _createUi() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: dataBean == null ? 0 : dataBean.length,
      itemBuilder: (BuildContext context, int index) {
        return OnSlide(items: <ActionItems>[
          if (dataBean[index].subItem == null)
            ActionItems(
                icon: new Icon(
                  Icons.code,
                  color: Colors.white,
                ),
                onPress: () {
                  navigationPush(
                      context,
                      CodePreviewsPage(
                        title: dataBean[index].title,
                        path: dataBean[index].codePreview,
                        item: dataBean[index],
                      ));
                },
                backgroudColor: Colors.green),
          if (dataBean[index].subItem == null)
            ActionItems(
                icon: new Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPress: () {
                  try {
                    shareText(dataBean[index]);
                  } catch (e) {
                    print('error: $e');
                  }
                },
                backgroudColor: Colors.blue),
        ], child: taskRow(context, dataBean[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return getDivider();
      },
    );
  }


  Widget taskRow(BuildContext context, TaskItem taskItem) {
    return InkWell(
      onLongPress: () {
        onlongPress(taskItem);
      },
      // splashColor: Col,
      onTap: () => onTap(taskItem), //nextScreen(context, screenName),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 3, top: 5, bottom: 5),
        child: new Row(
          children: <Widget>[
            CircleAvatar(
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                radius: 35.0,
                child: getTxtWhiteColor(
                    msg: taskItem.title[0].toUpperCase(),
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(left: 8)),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      getTxtBlackColor(
                          msg: taskItem.title,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      getTxtGreyColor(
                          msg: StringConst.DUMMY_TEXT, fontSize: 15),
                    ],
                  ),
                  if (taskItem.subItem == null)
                    Align(
                      alignment: Alignment.topRight,
                        child: IconButton(
                          iconSize: 40,
                          padding: EdgeInsets.all(0),
                          icon: CircleAvatar(
                            backgroundColor: Colors.grey.shade300.withOpacity(0.4),
                            child: Icon(Icons.more_vert),
                          ),
                          onPressed: () =>optionMenu(context, taskItem),
                        )
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
shareText(TaskItem dataBean) async {
  // print(StringConst.githubRepo + dataBean.codePreview);
  try {
    await Share.text(dataBean.title,
        StringConst.githubRepo + dataBean.codePreview, 'text/plain');
  } catch (e) {
    print('error: $e');
  }
}
