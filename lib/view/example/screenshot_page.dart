import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
// import 'package:path_provider/path_provider.dart';

class ScreenshotPage extends StatefulWidget {
  @override
  _ScreenshotPageState createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
  static GlobalKey previewContainer = GlobalKey();
  static const androidMethodChannel =
      const MethodChannel('team.native.io/screenshot');

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        key: previewContainer,
        child: Scaffold(
          appBar: getAppBarWithBackBtn(
              ctx: context, title: StringConst.SCREENSHOT_TITLE),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                MaterialButton(
                  onPressed: _screenShot,
                  child: const Text('Take Screenshot'),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  Future<void> _screenShot() async {
    try {
      RenderRepaintBoundary? boundary =
          previewContainer.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image? image = await boundary?.toImage();
      //TODO UNDO
      // final directory = (await getExternalStorageDirectory()).path;
      ByteData? byteData =
          await image!.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      // File imgFile = new File('$directory/screenshot.png');
      // imgFile.writeAsBytes(pngBytes);
      // Uri fileURI = new Uri.file('$directory/screenshot.png');
      // print('Screenshot Path:' + imgFile.path);
      // await androidMethodChannel
      //     .invokeMethod('takeScreenshot', {'filePath': imgFile.path});
    } on PlatformException catch (e) {
      printLog(msg: "Exception while taking screenshot:" + e.toString());
    }
  }
}
