import 'dart:io';

// import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ShareDataScreen extends StatefulWidget {
  @override
  _ShareDataScreenState createState() => _ShareDataScreenState();
}

class _ShareDataScreenState extends State<ShareDataScreen> {
  late BuildContext _ctx;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.DATA_SHARE_TITLE),
      body: Builder(builder: (_context) {
        return _createUi(_context);
      }),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            raisedBtn('Share text', _shareText),
            SizedBox(height: 10),
            raisedBtn('Share image', _shareImage),
            SizedBox(height: 10),
            raisedBtn('Share images', _shareImages),
            SizedBox(height: 10),
            raisedBtn('Share CSV', _shareCSV),
            SizedBox(height: 10),
            raisedBtn('Share mixed', _shareMixed),
            SizedBox(height: 10),
            raisedBtn('Share image from url', _shareImageFromUrl),
          ],
        ),
      ),
    );
  }

  _shareText() async {
    try {
      // await Share.text(StringConst.APP_NAME, StringConst.DUMMY_TEXT, 'text/plain');
    } catch (e) {
      printLog(msg: 'error: $e');
    }
  }

  _shareImage() async {
    try {
      final ByteData bytes = await rootBundle.load(AssetsConst.LOGO_IMG);
      // await Share.file(
      //     StringConst.APP_NAME, 'logo.png', bytes.buffer.asUint8List(), 'image/png',
      //     text: StringConst.APP_NAME);
    } catch (e) {
      printLog(msg: 'error: $e');
    }
  }

  _shareImages() async {
    try {
      final ByteData bytes1 = await rootBundle.load(AssetsConst.SLIDER1_IMG);
      final ByteData bytes2 = await rootBundle.load(AssetsConst.SLIDER2_IMG);

      // await Share.files(
      //     StringConst.APP_NAME,
      //     {
      //       'esys.png': bytes1.buffer.asUint8List(),
      //       'bluedan.png': bytes2.buffer.asUint8List(),
      //     },
      //     'image/png');
    } catch (e) {
      printLog(msg: 'error: $e');
    }
  }

  _shareCSV() async {
    try {
      final ByteData bytes = await rootBundle.load(AssetsConst.INSURANCE_CSV);
      // await Share.file(
      //     StringConst.APP_NAME, 'addresses.csv', bytes.buffer.asUint8List(), 'text/csv');
    } catch (e) {
      printLog(msg: 'error: $e');
    }
  }

  _shareMixed() async {
    try {
      final ByteData bytes1 = await rootBundle.load(AssetsConst.SLIDER1_IMG);
      final ByteData bytes2 = await rootBundle.load(AssetsConst.SLIDER2_IMG);
      final ByteData bytes3 = await rootBundle.load(AssetsConst.INSURANCE_CSV);

      // await Share.files(
      //     StringConst.APP_NAME,
      //     {
      //       'esys.png': bytes1.buffer.asUint8List(),
      //       'bluedan.png': bytes2.buffer.asUint8List(),
      //       'insurance.csv': bytes3.buffer.asUint8List(),
      //     },
      //     '*/*',
      //     text: 'My optional text.');
    } catch (e) {
      printLog(msg: 'error: $e');
    }
  }

  _shareImageFromUrl() async {
    try {
      var request = await HttpClient().getUrl(Uri.parse(
          'https://avatars0.githubusercontent.com/u/38448422?s=460&u=21b610183d275611a9bc0f730653d931b39f2d0b&v=4'));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      // await Share.file(StringConst.APP_NAME, 'amlog.jpg', bytes, 'image/jpg');
    } catch (e) {
      printLog(msg: 'error: $e');
    }
  }
}
