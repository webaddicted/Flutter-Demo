import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_audio_bean.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storage_path/storage_path.dart';

class AudioScreen extends StatefulWidget {
  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  BuildContext _ctx;
  var listData = List<DeviceAudioBean>();

  @override
  void initState() {
    super.initState();
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.AUDIO_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            _reqPermission();
          }),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.length == 0) return showPbIndicator();
    return new Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return getDocRow();
          },
        ));
  }

  Widget getDocRow() {
    return Container();
  }

  void _reqPermission() {
    var _storagePermission = Permission.storage;
    var permissionArray = [_storagePermission];
    checkPermission(_ctx, permissionArray, getAllAudio);
  }

  void getAllAudio(bool isPermissionGrented) async {
    if (!isPermissionGrented) return;
    if (listData != null) listData.clear();
    setState(() {});
    String audioPath = await StoragePath.audioPath;
    var response = jsonDecode(audioPath);
    var audioList = response as List;
    listData = audioList
        .map<DeviceAudioBean>((json) => DeviceAudioBean.fromJson(json))
        .toList();
    showSnackBar(_ctx, 'Audio count are  : ${listData.length}');
    print('asdad  ' + listData.toString());
    setState(() {});
  }
}
