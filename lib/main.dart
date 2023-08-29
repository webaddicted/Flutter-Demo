import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/theme/app_theme.dart';
import 'package:flutterbeginner/global/utils/file_utils.dart';
import 'package:flutterbeginner/view/letstart/splash_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await createApplicationFolder();
  // Set Orientation to PortraitUp
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//      .then((_) {
//    // Run MainApp
//    runApp(new MyApp());
//  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        themeMode: ThemeMode.system,
        home: const SplashPage());
  }
// Widget getUi(){
//   return GetMaterialApp(
//     useInheritedMediaQuery: false,
//     builder: (context, widget) => ResponsiveWrapper.builder(
//       ClampingScrollWrapper.builder(context, widget!),
//       defaultScale: true,
//       minWidth: kIsWeb ? 400 : 480,
//       maxWidth: kIsWeb ? 400 : double.infinity,
//       defaultName: MOBILE,
//       breakpoints: [
//         const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
//         const ResponsiveBreakpoint.resize(600, name: MOBILE),
//         const ResponsiveBreakpoint.resize(850, name: TABLET),
//         const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
//       ],
//       background: Container(
//         color: Colors.white,
//       ),
//     ),
//     title: TextConst.app_title,
//     //darkTheme: darkThemeData(context),
//     theme: lightThemeData(context),
//     themeMode: ThemeMode.system,
//     debugShowCheckedModeBanner: false,
//     initialBinding: AppBindings(),
//     getPages: AppPages.routes,
//     initialRoute: AppRoute.splashScreen,
//   );
// }
}
