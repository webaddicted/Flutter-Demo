import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_video_bean.dart';
import 'package:flutterbeginner/view/local/video/video_folder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storage_path/storage_path.dart';

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
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.VIDEO_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _reqPermission();
          },
          child: Icon(Icons.refresh, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.length == 0) return showPbIndicator();
    return Container(
        alignment: Alignment.center,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return getVideoRow(listData[index], index);
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }

  Widget getVideoRow(DeviceVideoBean videoBean, int index) {
    return InkWell(
      onTap: () {
        navigationPush(context, VideoFolder(videoBean));
      },
      child: Container(
        child: Card(
            clipBehavior: Clip.antiAlias ,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              loadImg(ApiConstant.DEMO_IMG, 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: getTxtBlackColor(
                    msg:videoBean.folderName + ' [${videoBean.files.length}]',
                    fontSize:15,
                    textAlign:TextAlign.center,
                    fontWeight:FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _reqPermission() {
    List<Permission>permission = List();
    permission.add(Permission.storage);
    checkPermission(_ctx, permission, getLocalVideo);
  }

  void getLocalVideo(bool isPermissionGrented) async {
    if (!isPermissionGrented) return;
    if (listData != null) listData.clear();
    String videoPath = await StoragePath.videoPath;
    var response = jsonDecode(videoPath);
    var imageList = response as List;
    listData = imageList
        .map<DeviceVideoBean>((json) => DeviceVideoBean.fromJson(json))
        .toList();
    showSnackBar(_ctx, 'Video count are  : ${listData.length}');
    print('asdad  ' + listData.toString());
    setState(() {});
  }
}
