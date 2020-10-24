import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/file_utils.dart';
import 'package:flutterbeginner/view/alltask/all_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await createApplicationFolder();
  // Set Orientation to PortraitUp
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//      .then((_) {
//    // Run MainApp
//    runApp(new MyApp());
//  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConst.APP_NAME,
//      debugShowCheckedModeBanner: false,
//      darkTheme: ThemeData.dark(),
      theme: ThemeData(
          fontFamily: AssetsConst.ZILLASLAB_FONT,
          accentColor: ColorConst.APP_COLOR,
          accentColorBrightness: Brightness.light,
          primarySwatch: ColorConst.APP_COLOR,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: ALLTask(),
    );
  }
}
