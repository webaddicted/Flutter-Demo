import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/api/api_dio_arch_page.dart';
import 'package:flutterbeginner/view/api/api_dio_page.dart';
import 'package:flutterbeginner/view/api/api_http_page.dart';
import 'package:flutterbeginner/view/api/git_https_users.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';

class ApiCallPage extends StatelessWidget {
  List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return new Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.LIST_DESIGN_TITLE),
      body: HomeItemWidget(
        dataBean: dataBean,
        onTap: (screenName) => nextScreen(context, screenName),
      ),
    );
  }

  List<String> setData() {
    dataBean = new List<String>();
    dataBean.add("Http Api Call");
    dataBean.add("Git Api Call");
    dataBean.add("DIO Api Call");
    dataBean.add("DIO Architecture");
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case 'Http Api Call':
        return navigationPush(context, ApiHttpPage());
      case 'Git Api Call':
        return navigationPush(context, GitUsers());
      case 'DIO Api Call':
        return navigationPush(context, ApiDioPage());
      case 'DIO Architecture':
        return navigationPush(context, ApiDioArchPage());
      default:
       return showSnackBar(context, "Pending Task");
        break;
    }
  }
}
