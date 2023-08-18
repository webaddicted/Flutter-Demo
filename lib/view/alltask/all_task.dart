import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/alltask/nav_drawer_home.dart';
import 'package:flutterbeginner/view/alltask/subtitle_page.dart';
import 'package:flutterbeginner/view/widgets/all_item_widget.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class AllTasks extends StatefulWidget {
  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  List<TaskItem> dataBean = [];
  List<TaskItem> searchDataBean = [];

  _AllTasksState() {
    const Padding(
      padding: EdgeInsets.only(top: 58.0, right: 10, left: 10),

      /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
      /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
      // child: AnimSearchBar(
      //   width: 400,
      //   textController: textController,
      //   onSuffixTap: () {
      //     setState(() {
      //       textController.clear();
      //     });
      //   },
      // ),
    );

    // searchBar = SearchBar(
    //     inBar: false,
    //     buildDefaultAppBar: buildAppBar,
    //     setState: setState,
    //     onChanged: onDataChange,
    //     onCleared: () {
    //       onDataChange("");
    //       // print("cleared");
    //     },
    //     onClosed: () {
    //       onDataChange("");
    //       // print("closed");
    //     });
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
              (e.title!.toUpperCase().contains(value.toUpperCase())) ||
              e.title!.toUpperCase().contains(value.toUpperCase()))
          .toList();
      setState(() {});
      // print("List : ${searchDataBean.length}  ${dataBean.length}");
    } catch (exp) {
      printLog(msg: 'Search exp: $exp');
    }
  }

  @override
  void initState() {
    dataBean = taskItem;
    dataBean.sort((a, b) => a.title!.compareTo(b.title!));
    searchDataBean = dataBean;
    super.initState();
  }
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];
  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
          title: getTxtAppColor(msg: StringConst.APP_NAME, fontSize: 16,fontWeight: FontWeight.w700),
          backgroundColor: ColorConst.WHITE_COLOR,
          iconTheme: const IconThemeData(color: ColorConst.APP_COLOR),
          searchBackIconTheme: const IconThemeData(color: ColorConst.APP_COLOR),
          searchClearIconTheme: const IconThemeData(color: ColorConst.APP_COLOR),
          elevation: 5,
          animationDuration: const Duration(seconds: 2),
          searchHintText: StringConst.APP_NAME,
          searchTextStyle: const TextStyle(fontWeight: FontWeight.w500),
          searchCursorColor: ColorConst.APP_COLOR,
          onSearch: (value) => onDataChange(value),
          actions: [
            IconButton(icon: const Icon(Icons.person, color: ColorConst.APP_COLOR), onPressed: () {})
          ],
          asyncSuggestions: (value) async => await _fetchSuggestions(value)),
      drawer: NavDrawerHome(),
      body: AllItemWidget(
          dataBean: searchDataBean,
          onTap: (TaskItem taskItem) {
            if (taskItem.subItem == null) {
              navigationPush(context, taskItem.page!);
            } else {
              navigationPush(context, SubTitlePage(taskItem));
            }
          },
          onlongPress: (TaskItem taskItem) {
            if (taskItem.subItem == null) optionMenu(context, taskItem);
          }),
    );
  }

  accDecMenu(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
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
                        searchDataBean
                            .sort((a, b) => a.title!.compareTo(b.title!));
                      });

                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        child: getTxtBlackColor(msg: 'Accending'))),
                InkWell(
                    onTap: () {
                      setState(() {
                        searchDataBean
                            .sort((a, b) => b.title!.compareTo(a.title!));
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
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
      // searchBar.getSearchAction(context),
      IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => accDecMenu(context)),
    ]);
  }
}
