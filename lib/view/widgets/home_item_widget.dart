import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';

class HomeItemWidget extends StatelessWidget {
  final List<TaskItem> dataBean;
  final Function onTap;
  final Function onlongPress;

  HomeItemWidget({@required this.dataBean, @required this.onTap, this.onlongPress});

  @override
  Widget build(BuildContext context) {
    return _createUi();
  }

  Widget _createUi() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: dataBean == null ? 0 : dataBean.length,
        itemBuilder: (BuildContext context, int index) {
          return taskRow(context, dataBean[index]);
        });
  }

  Widget taskRow(BuildContext context, TaskItem taskItem) {
    return InkWell(
      onLongPress: (){onlongPress(taskItem);},
      // splashColor: Col,
      onTap: () => onTap(taskItem), //nextScreen(context, screenName),
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 5),
          child: new Row(
            children: <Widget>[
              CircleAvatar(
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  radius: 35.0,
                  child: getTxtWhiteColor(
                      msg: taskItem.title[0].toUpperCase(),
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(left: 8)),
              Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    getTxtBlackColor(
                        msg: taskItem.title,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    getTxtGreyColor(msg: StringConst.DUMMY_TEXT, fontSize: 15),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
