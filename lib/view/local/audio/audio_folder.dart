import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_audio_bean.dart';
import 'package:flutterbeginner/view/local/audio/audio_screen_list.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioFolder extends StatefulWidget {
  const AudioFolder({super.key});

  @override
  State<AudioFolder> createState() => _AudioFolderState();
}

class _AudioFolderState extends State<AudioFolder> {
  late BuildContext _ctx;
  List<DeviceAudioBean> listData = [];

  @override
  void initState() {
    super.initState();
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(ctx: context, title: StringConst.AUDIO_TITLE),
      body: Builder(builder: (context) => _createUi(context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.isEmpty) return showPbIndicator();
    return Container(
        alignment: Alignment.center,
        child: GridView.builder(
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int index) {
              return getAudioRow(listData[index], index);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5 / 1.8,
            )));
  }

  Widget getAudioRow(DeviceAudioBean imageBean, int index) {
    return InkWell(
      onTap: ()=>navigationPush(context, AudioScreenList(imageBean)),
      child: Card(
          color: ColorConst.GREY_COLOR,
          child: addRoundedCorners(
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Align(alignment: Alignment.center,
                    child: Icon(Icons.audiotrack_outlined, size: 100,color: ColorConst.APP_COLOR)),
                Container(
                  color: ColorConst.transpBlack,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8.0),
                  child: getTxtWhiteColor(
                      msg:
                          '${imageBean.folderName!} [${imageBean.files?.length}]',
                      fontSize: 15,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }

  _reqPermission() {
    List<Permission> permission = [Permission.storage];
    checkPermission(
        permission: permission,
        permissionResponse: (List<Permission> permissionDenied) {
          if (permissionDenied == null || permissionDenied.isEmpty) {
            getAllAudio(true);
          } else {
            printLog(
                msg:
                    "${permissionDenied[0]} permission is Denied. ${permissionDenied.length}");
          }
        });
  }

  void getAllAudio(bool isPermissionGranted) async {
    if (!isPermissionGranted) return;
    if (listData != null) listData.clear();
    setState(() {});
    var audioPath = await StoragePath.audioPath;
    var response = jsonDecode(audioPath!);
    var audioList = response as List;
    listData = audioList
        .map<DeviceAudioBean>((json) => DeviceAudioBean.fromJson(json))
        .toList();
    showSnackBar(_ctx, 'Audio count are  : ${listData.length}');
    printLog(msg: 'asdad  $listData');
    setState(() {});
  }
}
