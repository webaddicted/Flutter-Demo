import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_video_bean.dart';
import 'package:flutterbeginner/view/local/video/video_folder.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoScreen extends StatefulWidget {
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late BuildContext _ctx;

  List<DeviceVideoBean> listData = [];

  @override
  void initState() {
    super.initState();
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            getAppBarWithBackBtn(ctx: context, title: StringConst.VIDEO_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _reqPermission();
          },
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.isEmpty) return showPbIndicator();
    return Container(
        alignment: Alignment.center,
        child: GridView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return getVideoRow(listData[index], index);
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2.5 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ));
  }

  Widget getVideoRow(DeviceVideoBean videoBean, int index) {
    return InkWell(
      onTap: () => navigationPush(context, VideoFolder(videoBean)),
      child: Card(
          color: ColorConst.GREY_COLOR,
          child: addRoundedCorners(
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.video_library,
                        size: 100, color: ColorConst.APP_COLOR)),
                Container(
                  color: ColorConst.transpBlack,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8.0),
                  child: getTxtWhiteColor(
                      msg:
                          '${videoBean.folderName!} [${videoBean.files?.length}]',
                      fontSize: 15,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }

  void _reqPermission() {
    List<Permission> permission = [Permission.storage];
    checkPermission(
        permission: permission,
        permissionResponse: (List<Permission> permissionDenied) {
          if (permissionDenied == null || permissionDenied.isEmpty) {
            getLocalVideo(true);
          } else {
            printLog(
                msg:
                    "${permissionDenied[0]} permission is Denied. ${permissionDenied.length}");
          }
        });
  }

  void getLocalVideo(bool isPermissionGranted) async {
    if (!isPermissionGranted) return;
    if (listData != null) listData.clear();
    var videoPath = await StoragePath.videoPath;
    var response = jsonDecode(videoPath!);
    var imageList = response as List;
    listData = imageList
        .map<DeviceVideoBean>((json) => DeviceVideoBean.fromJson(json))
        .toList();
    showSnackBar(_ctx, 'Video count are  : ${listData.length}');
    setState(() {});
  }
}
