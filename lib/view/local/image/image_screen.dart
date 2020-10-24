import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_image_bean.dart';
import 'package:flutterbeginner/view/local/image/image_folder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:storage_path/storage_path.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  BuildContext _ctx;

  var listData = List<DeviceImageBean>();

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
            return getImageRow(listData[index], index);
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }

  Widget getImageRow(DeviceImageBean imageBean, int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: () {
            navigationPush(context, ImageFolder(imageBean));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(4, 4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Image.file(File(imageBean.files[0]),
                    width: double.infinity,
                    height: index % 2 == 0 ? 180 : 130,
                    fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getTxtBlackColor(
                      msg:
                          imageBean.folderName + ' [${imageBean.files.length}]',
                      fontSize: 15,
                      textAlign:TextAlign.center,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _reqPermission() {
    var _storagePermission = Permission.storage;
    var permissionArray = [_storagePermission];
    checkPermission(_ctx, permissionArray, getLocalImage);
  }

  void getLocalImage(bool isPermissionGrented) async {
    if (!isPermissionGrented) return;
    if (listData != null) listData.clear();
    String videoPath = await StoragePath.imagesPath;
    var response = jsonDecode(videoPath);
    var imageList = response as List;
    listData = imageList
        .map<DeviceImageBean>((json) => DeviceImageBean.fromJson(json))
        .toList();
    showSnackBar(_ctx, 'Images count are  : ${listData.length}');
    print('asdad  ' + listData.toString());
    setState(() {});
  }
}
