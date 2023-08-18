import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class WebViewScreen extends StatefulWidget {
  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context,title: StringConst.WEB_VIEW_TITLE),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return const Column(
      children: [
        //TODO UNDO
//           Expanded(
//               child: WebView(
// //                  key: _key,
//                   javascriptMode: JavascriptMode.unrestricted,
//                   initialUrl: ApiConstant.WEB_VIEW_URL))
      ],
    );
  }
}
