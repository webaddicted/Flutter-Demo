import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/service/push_noti_mgr.dart';
import 'package:flutterbeginner/view/alltask/all_task.dart';

void main() {
  Stetho.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PushNotiMgr().init();
    return MaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
//      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        fontFamily: AssetsConst.ZILLASLAB_FONT,
        accentColor: ColorConst.APP_COLOR,
        accentColorBrightness: Brightness.light,
        primarySwatch: ColorConst.APP_COLOR,
      ),
      home: ALLTask(),
    );
  }
}
