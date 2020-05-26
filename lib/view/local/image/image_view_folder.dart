import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_image_bean.dart';
import 'package:flutterbeginner/view/local/image/full_image_view.dart';

class ImageViewFolder extends StatefulWidget {
  DeviceImageBean imageBean;
  ImageViewFolder(this.imageBean);
  @override
  _ImageViewFolderState createState() => _ImageViewFolderState(imageBean);
}

class _ImageViewFolderState extends State<ImageViewFolder> {
  BuildContext ctx;
  DeviceImageBean imageBean;
  _ImageViewFolderState(this.imageBean);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, imageBean.folderName),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return Container(
      alignment: Alignment.center,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: imageBean.files.length,
        itemBuilder: (BuildContext context, int index) {
          return getImageRow(imageBean.files[index], index);
        },
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ));
  }
  Widget getImageRow(String imageFiles, int index) {
    return InkWell(
      onTap: () {
        navigationPush(context, FullImageView(null,File(imageFiles)));
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
             Image.file(File(imageFiles),
                  width: double.infinity,
                  height: index % 2 == 0 ? 180 : 130, fit: BoxFit.cover),

//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: getTxtBlackCenterColor(
//                getFileName(imageFiles), 15, FontWeight.bold),
//          ),
          ],
        ),
      ),
    );
  }


}
