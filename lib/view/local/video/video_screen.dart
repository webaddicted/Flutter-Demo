import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_video_bean.dart';
import 'package:flutterbeginner/view/local/image/image_folder.dart';
import 'package:flutterbeginner/view/local/video/video_folder.dart';
import 'package:storage_path/storage_path.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  BuildContext _ctx;
  var listData = List<DeviceVideoBean>();

  @override
  void initState() {
    super.initState();
    getAllVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.VIDEO_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            getAllVideo();
          }),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.length == 0) return showPbIndicator(true);
    return new Container(
        alignment: Alignment.center,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return allVideoRow(listData[index], index);
          },
          staggeredTileBuilder: (int index) => StaggeredTile.fit(3),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }

  Widget allVideoRow(DeviceVideoBean videoBean, int index) {
    return GestureDetector(
      onTap: () {
        navigationPush(context, VideoFolder(videoBean));
      },
      child: Card(
        child: Column(
          children: <Widget>[
//            Image.file(File(videoBean.files[0].path),
//                height: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: getTxtBlackCenterColor(
                  videoBean.folderName + ' [${videoBean.files.length}]',
                  15,
                  FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void getAllVideo() async {
    if (listData != null) listData.clear();
    String videoPath = await StoragePath.videoPath;
    var response = jsonDecode(videoPath);
    var imageList = response as List;
    listData = imageList
        .map<DeviceVideoBean>((json) => DeviceVideoBean.fromJson(json))
        .toList();
    setState(() {});
  }
}
