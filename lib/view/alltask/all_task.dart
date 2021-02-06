import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/alltask/nav_drawer_home.dart';
import 'package:flutterbeginner/view/alltask/subtitle_page.dart';
import 'package:flutterbeginner/view/widgets/all_item_widget.dart';

class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  List<TaskItem> dataBean = new List();
  List<TaskItem> searchDataBean = new List();
  BuildContext ctx;
  SearchBar searchBar;

  _AllTasksState() {
    searchBar = SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onChanged: onDataChange,
        onCleared: () {
          onDataChange("");
          // print("cleared");
        },
        onClosed: () {
          onDataChange("");
          // print("closed");
        });
  }

  void onDataChange(String value) {
    try {
      // searchDataBean = dataBean
      //     .where((e) =>
      //         (e.toUpperCase().contains(value.toUpperCase())) ||
      //         e.toUpperCase().contains(value.toUpperCase()))
      //     .toList();
      searchDataBean = dataBean
          .where((e) =>
              (e.title.toUpperCase().contains(value.toUpperCase())) ||
              e.title.toUpperCase().contains(value.toUpperCase()))
          .toList();
      setState(() {});
      // print("List : ${searchDataBean.length}  ${dataBean.length}");
    } catch (exp) {
      print('Search exp: $exp');
    }
  }

  @override
  void initState() {
    dataBean = taskItem;
    dataBean.sort((a, b) => a.title.compareTo(b.title));
    searchDataBean = dataBean;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      appBar: searchBar.build(context),
      drawer: NavDrawerHome(),
      body:
      AllItemWidget(
          dataBean: searchDataBean,
          onTap: (TaskItem taskItem) {
            if (taskItem.subItem == null)
              navigationPush(context, taskItem.page);
            else
              navigationPush(context, SubTitlePage(taskItem));
          },
          onlongPress: (TaskItem taskItem) {
            if (taskItem.subItem == null) optionMenu(context, taskItem);
          }),
    );
  }

  accDecMenu(BuildContext context) {
    showDialog(
        context: context,
        builder:(_) =>  new AlertDialog(
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
                      setState(() {
                        searchDataBean.sort((a, b) => a.title.compareTo(b.title));
                      });

                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: getTxtBlackColor(msg: 'Accending'))),
                InkWell(
                    onTap: () {
                      setState(() {
                        searchDataBean.sort((a, b) => b.title.compareTo(a.title));
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: getTxtBlackColor(msg: 'Decending'))),
              ],
            ))));
  }

  AppBar buildAppBar(BuildContext context) {
    return getAppBar(title: StringConst.FLUTTER_DEMO_TITLE, actions: [
      // IconButton(
      //     icon: const Icon(Icons.sort_by_alpha),
      //     tooltip: 'Sort',
      //     onPressed: () {
      //       _reverseSort = !_reverseSort;
      //       setState(() {
      //         if (_reverseSort)
      //           searchDataBean
      //               .sort((a, b) => a.title.compareTo(b.title)); //accending
      //         else
      //           searchDataBean
      //               .sort((a, b) => b.title.compareTo(a.
      //               title)); //decending
      //         // searchDataBean.sort((TaskItem a, TaskItem b) => _reverseSort
      //         //     ? b.title.compareTo(a.title)
      //         //     : a.title.compareTo(b.title));
      //       });
      //     }),
      searchBar.getSearchAction(context),
      IconButton(
          icon: Icon(Icons.more_vert), onPressed: () => accDecMenu(context)),
    ]);
  }
}
