import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_video_bean.dart';
import 'package:flutterbeginner/view/example/video_player_screen.dart';
// import 'package:video_player/video_player.dart';

class VideoFolder extends StatefulWidget {
  DeviceVideoBean videoBean;

  VideoFolder(this.videoBean, {super.key});

  @override
  State<VideoFolder> createState() => _VideoFolderState(videoBean);
}

class _VideoFolderState extends State<VideoFolder> {
  DeviceVideoBean videoBean;

  _VideoFolderState(this.videoBean);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx:context, title:'${videoBean.folderName} [${videoBean.files?.length}]'),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: videoBean.files == null ? 0 : videoBean.files?.length,
            itemBuilder: (BuildContext context, int index) {
              return getVideoRow(videoBean.files![index], index);
            }));
  }

  Widget getVideoRow(VideoFiles videoBean, int index) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          navigationPush(
              context, VideoPlayerScreen(null, File(videoBean.path!)));
        },
        onLongPress: () {
          videoDetails(videoBean);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox(
                          width: 120, child: loadImg(ApiConstant.DEMO_IMG, 0)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          color: Colors.black54,
                          child: getTxtWhiteColor(
                             msg: formatTime(double.parse(videoBean.duration!)),
                              fontWeight:FontWeight.bold)
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: getTxtBlackColor(
                          msg:videoBean.displayName!, fontSize:15, fontWeight:FontWeight.bold),
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
    var dialogDetails = Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          getTxtAppColor(msg:videoBean.displayName!, fontSize:18, fontWeight:FontWeight.bold),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
            height: 1,
          ),
          const SizedBox(height: 10),
          getTxt(msg:'File Path : ${videoBean.path}'),
          const SizedBox(height: 10),
          getTxt(msg:'Album : ${videoBean.album}'),
          const SizedBox(height: 10),
          getTxt(msg:'Artist : ${videoBean.artist}'),
          const SizedBox(height: 10),
          getTxt(msg:'Duration : ${formatTime(double.parse(videoBean.duration!))}'),
          const SizedBox(height: 10),
          getTxt(msg:'Date Added : ${DateTime.fromMillisecondsSinceEpoch(int.parse(videoBean.dateAdded!)).toString()}'),
          const SizedBox(height: 10),
          getTxt(msg:'Size : ${filesize(videoBean.size)}'),
          const SizedBox(height: 40),
        ],
      ),
    );
    showCustomDialog(ctx:context, dialogUi:dialogDetails);
  }
//   Widget getVideoThumb(File videoFile){
//     var _controller = VideoPlayerController.file(videoFile)
//       ..initialize().then((_) {
// //      setState(() {});
//       });
//     return VideoPlayer(_controller);
//   }
}
