import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:path_provider/path_provider.dart';

class ScreenshotPage extends StatefulWidget {
  @override
  _ScreenshotPageState createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
  static GlobalKey previewContainer = new GlobalKey();
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
    return new RepaintBoundary(
        key: previewContainer,
        child: new Scaffold(
          appBar: getAppBarWithBackBtn(
              ctx: context, title: StringConst.SCREENSHOT_TITLE),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'You have pushed the button this many times:',
                ),
                new Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                new RaisedButton(
                  onPressed: _screenShot,
                  child: new Text('Take Screenshot'),
                )
              ],
            ),
          ),
          floatingActionButton: new FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  Future<Null> _screenShot() async {
    try {
      RenderRepaintBoundary boundary =
          previewContainer.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      final directory = (await getExternalStorageDirectory()).path;
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);
      Uri fileURI = new Uri.file('$directory/screenshot.png');
      print('Screenshot Path:' + imgFile.path);
      await androidMethodChannel
          .invokeMethod('takeScreenshot', {'filePath': imgFile.path});
    } on PlatformException catch (e) {
      print("Exception while taking screenshot:" + e.toString());
    }
  }
}
