import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  BuildContext _ctx;
  var listData = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.VIDEO_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.youtube_searched_for), onPressed: () {}),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ListView.builder(
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0)
                return showPbIndicator(true);
              else
                return Container();
            },
          )
        ],
      ),
    );
  }
}
