import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_image_bean.dart';
import 'package:flutterbeginner/view/local/image/full_image.dart';

class ImageFolder extends StatefulWidget {
  DeviceImageBean imageBean;

  ImageFolder(this.imageBean);

  @override
  _ImageFolderState createState() => _ImageFolderState(imageBean);
}

class _ImageFolderState extends State<ImageFolder> {
  BuildContext _ctx;
  DeviceImageBean imageBean;

  _ImageFolderState(this.imageBean);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, imageBean.folderName),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: imageBean.files.length,
          itemBuilder: (BuildContext context, int index) {
            return allImageRow(imageBean.files[index]);
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(3),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }

  Widget allImageRow(String imgFile) {
    return GestureDetector(
      onTap: () {
        navigationPush(context, FullImage(null, File(imgFile)));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Image.file(File(imgFile), height: 150, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
