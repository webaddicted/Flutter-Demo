import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context,title: StringConst.WEB_VIEW_TITLE),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
      child: Column(
        children: [
          Expanded(
              child: WebView(
//                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: ApiConstant.WEB_VIEW_URL))
        ],
      ),
    );
  }
}
