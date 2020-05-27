import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_video_bean.dart';
import 'package:flutterbeginner/view/local/video/video_folder.dart';
import 'package:storage_path/storage_path.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  BuildContext ctx;

  var listData = List<DeviceVideoBean>();

  @override
  void initState() {
    super.initState();
    getLocalVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.VIDEO_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getLocalVideo();
          },
          child: Icon(Icons.refresh, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    if (listData == null || listData.length == 0) return showPbIndicator(true);
    return Container(
      alignment: Alignment.center,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => getVideoRow(listData[index], index),
        itemCount: 4,
      ),
    );
  }

  Widget getVideoRow(DeviceVideoBean videoBean, int index) {
    return InkWell(
      onTap: (){
        navigationPush(context, VideoFolder(videoBean));
      },
      child: Container(
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              loadImg(ApiConst.DEMO_IMG, 0),
              Expanded(
                  child: getTxt(
                      videoBean.folderName + ' [${videoBean.files.length}]',
                      FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  void getLocalVideo() async {
    if (listData != null) listData.clear();
    String videoPath = await StoragePath.videoPath;
    var response = jsonDecode(videoPath);
    var imageList = response as List;
    listData = imageList
        .map<DeviceVideoBean>((json) => DeviceVideoBean.fromJson(json))
        .toList();
    print('asdad  ' + listData.toString());
    setState(() {});
  }
}
