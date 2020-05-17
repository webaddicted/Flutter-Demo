import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/file_utils.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class DownloadFileScreen extends StatefulWidget {
  @override
  _DownloadFileScreenState createState() => _DownloadFileScreenState();
}

class _DownloadFileScreenState extends State<DownloadFileScreen> {
  BuildContext ctx;
  var imageUrl =
      'https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg';
//      "https://www.itl.cat/pngfile/big/10-100326_desktop-wallpaper-hd-full-screen-free-download-full.jpg";
  bool downloading = true;
  String downloadingStr = "No data";
  double download = 0.0;
  File fileUrl; // = File();

  @override
  void initState() {
    super.initState();
    downloadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.DOWNLOAD_FILE_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          downloadFile();
            },
          child: Icon(Icons.cloud_download, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
//    return Container();
    return Center(
      child: (fileUrl == null || (fileUrl.exists()) == null)
          ? Container(
              height: 250,
              width: 250,
              child: Card(
                color: Colors.pink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      downloadingStr,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          : Container(
              color: Colors.orange,
              child: Image.file(fileUrl,
                  width: 300, height: 200, fit: BoxFit.cover),
            ),
    );
  }

  Future<void> downloadFile() async {
    try {
//      var dir = await getExternalStorageDirectory();
      fileUrl = await getDownloadFile('fileName.jpg');
//      if (fileUrl.exists() != null) {
//        downloading = false;
//        setState(() {});
//        return;
//      }
      String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
      Dio dio = Dio();
      print('fileName   :  ' + fileName + '\n\n' + fileUrl.path);
      dio.download(imageUrl, '${fileUrl.path}',
          onReceiveProgress: (rec, total) {
        setState(() {
          downloading = true;
          download = (rec / total) * 100;
          downloadingStr =
              "Downloading Image : " + (download).toStringAsFixed(0);
          print('downloading   :  ' +
              downloadingStr +
              '     ' +
              download.toString());
        });

        setState(() {
          downloading = false;
          downloadingStr = "Completed";
        });
      });
    } catch (e) {
      print(e.getMessage());
    }
  }
}
