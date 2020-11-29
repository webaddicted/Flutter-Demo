import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/file_utils.dart';
import 'package:flutterbeginner/view/alltask/all_task.dart';
import 'package:flutterbeginner/view/letstart/splash_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await createApplicationFolder();
  // Set Orientation to PortraitUp
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//      .then((_) {
//    // Run MainApp
//    runApp(new MyApp());
//  });8
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarBrightness:
    //   Platform.isAndroid ? Brightness.dark : Brightness.light,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarDividerColor: Colors.grey,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // ));
    return MaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
//      darkTheme: ThemeData.dark(),
      theme: ThemeData(
          fontFamily: AssetsConst.ZILLASLAB_FONT,
          accentColor: ColorConst.PRIME_COLOR,
          accentColorBrightness: Brightness.light,
          primarySwatch: ColorConst.PRIME_COLOR,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: SplashPage(),
    );
  }
}
