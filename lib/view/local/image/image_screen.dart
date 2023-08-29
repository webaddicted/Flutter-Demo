import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_image_bean.dart';
import 'package:flutterbeginner/view/local/image/image_folder.dart';
import 'package:flutterbeginner/view/widgets/image_tile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
class ImageScreen extends StatefulWidget {
  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late BuildContext _ctx;

  List<DeviceImageBean> listData = [];

  @override
  void initState() {
    super.initState();
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.ALL_IMAGE_TITLE),
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
    return GridView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return getImageRow(listData[index], index);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5 / 1.8,
        ));
  }

  Widget getImageRow(DeviceImageBean imageBean, int index) {
    return InkWell(
      onTap: ()=>navigationPush(context, ImageFolder(imageBean)),
      child: Card(
          color: ColorConst.greyColor,
          child: addRoundedCorners(Stack(
            alignment: Alignment.bottomCenter,
            children: [
                ImageTile(imageBean.files![0]),
                Container(
                  color: ColorConst.transparentBlack,
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(8.0),
                  child: getTxtWhiteColor(
                      msg:
                      '${imageBean.folderName!} [${imageBean.files?.length}]',
                      fontSize: 15,
                      textAlign:TextAlign.center,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }


  void _reqPermission() {
    List<Permission>permission = [Permission.storage];
    checkPermission(permission: permission, permissionResponse: (List<Permission>permissionDenied){
      if(permissionDenied==null || permissionDenied.isEmpty){
        getLocalImage(true);
      }else{
        printLog(msg: "${permissionDenied[0]} permission is Denied. ${permissionDenied.length}");
      }
    });
  }

  void getLocalImage(bool isPermissionGranted) async {
    if (!isPermissionGranted) return;
    if (listData != null) listData.clear();
    var videoPath = await StoragePath.imagesPath;
    var response = jsonDecode(videoPath!);
    var imageList = response as List;
    listData = imageList
        .map<DeviceImageBean>((json) => DeviceImageBean.fromJson(json))
        .toList();
    showSnackBar(_ctx, 'Images count are  : ${listData.length}');
    printLog(msg: 'asdad  $listData');
    setState(() {});
  }
}
