import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_image_bean.dart';
import 'package:flutterbeginner/view/local/image/image_folder.dart';
import 'package:storage_path/storage_path.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  BuildContext ctx;

  var listData = List<DeviceImageBean>();

  @override
  void initState() {
    super.initState();
    getLocalImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.ALL_IMAGE_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getLocalImage();
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
    return InkWell(
      onTap: () {
        navigationPush(context, ImageFolder(imageBean));
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            Image.file(File(imageBean.files[0]),
                width: double.infinity,
                height: index % 2 == 0 ? 180 : 130,
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getTxtBlackCenterColor(
                  imageBean.folderName + ' [${imageBean.files.length}]',
                  15,
                  FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void getLocalImage() async {
    if (listData != null) listData.clear();
    String videoPath = await StoragePath.imagesPath;
    var response = jsonDecode(videoPath);
    var imageList = response as List;
    listData = imageList
        .map<DeviceImageBean>((json) => DeviceImageBean.fromJson(json))
        .toList();
    print('asdad  ' + listData.toString());
    setState(() {});
  }
}
