import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_video_bean.dart';
import 'package:flutterbeginner/view/example/video_player_screen.dart';
import 'package:video_player/video_player.dart';

class VideoFolder extends StatefulWidget {
  DeviceVideoBean videoBean;

  VideoFolder(this.videoBean);

  @override
  _VideoFolderState createState() => _VideoFolderState(videoBean);
}

class _VideoFolderState extends State<VideoFolder> {
  BuildContext _ctx;
  DeviceVideoBean videoBean;

  _VideoFolderState(this.videoBean);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          context, videoBean.folderName + ' [${videoBean.files.length}]'),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        alignment: Alignment.center,
        child: new ListView.builder(
            itemCount: videoBean.files == null ? 0 : videoBean.files.length,
            itemBuilder: (BuildContext context, int index) {
              return getVideoRow(videoBean.files[index], index);
            }));
  }

  Widget getVideoRow(VideoFiles videoBean, int index) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          navigationPush(
              context, VideoPlayerScreen(null, File(videoBean.path)));
        },
        onLongPress: () {
          videoDetails(videoBean);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          width: 120, child: loadImg(ApiConst.DEMO_IMG, 0)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          color: Colors.black54,
                          child: getTxtWhiteColor(
                              formatTime(double.parse(videoBean.duration)),
                              14,
                              FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: getTxtBlackColor(
                          videoBean.displayName, 15, FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void videoDetails(VideoFiles videoBean) {
    var dialogDetails = Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            getTxtAppColor(videoBean.displayName, 18, FontWeight.bold),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            SizedBox(height: 10),
            getTxt('File Path : ${videoBean.path}', null),
            SizedBox(height: 10),
            getTxt('Album : ${videoBean.album}', null),
            SizedBox(height: 10),
            getTxt('Artist : ${videoBean.artist}', null),
            SizedBox(height: 10),
            getTxt('Duration : ${formatTime(double.parse(videoBean.duration))}',
                null),
            SizedBox(height: 10),
            getTxt('Date Added : ${videoBean.dateAdded}', null),
            SizedBox(height: 10),
            getTxt('Size : ${filesize(videoBean.size)}', null),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
    showCustomDialog(context, dialogDetails);
  }
  Widget getVideoThumb(File videoFile){
    var _controller = VideoPlayerController.file(videoFile)
      ..initialize().then((_) {
//      setState(() {});
      });
    return VideoPlayer(_controller);
  }
}
