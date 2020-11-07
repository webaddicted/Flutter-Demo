import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';
/**
 * Author : Deepak Sharma(Webaddicted)
 * Email : deepaksharmatheboss@gmail.com
 * Profile : https://github.com/webaddicted
 */
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.LOGIN_DESIGN_TITLE),
      body: HomeItemWidget(
        dataBean: loginPageItem,
        onTap: (screenName, page) => navigationPush(context, page),
      ),
    );
  }
}
