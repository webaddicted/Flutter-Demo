import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  late BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
      var homeIcon = IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color:ColorConst.blackColor,
        ),
        onPressed: () => Navigator.pop(context));
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context,
          title: 'About Us',
          bgColor: ColorConst.whiteColor,
          txtColor: ColorConst.blackColor,
          // titleTag: 'About Us',
          icon: homeIcon),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
      child: Column(
        children: [
          //TODO UNDO
//           Expanded(
//               child: WebView(
// //                  key: _key,
//                   javascriptMode: JavascriptMode.unrestricted,
//                   initialUrl: ApiConstant.WEBADDICTED_VIEW_URL))
        ],
      ),
    );
  }
}
