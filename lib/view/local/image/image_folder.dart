import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_image_bean.dart';
import 'package:flutterbeginner/view/local/image/full_image.dart';

class ImageFolder extends StatefulWidget {
  DeviceImageBean imageBean;
  ImageFolder(this.imageBean);
  @override
  _ImageFolderState createState() => _ImageFolderState(imageBean);
}

class _ImageFolderState extends State<ImageFolder> {
  BuildContext ctx;
  DeviceImageBean imageBean;
  _ImageFolderState(this.imageBean);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context, title:imageBean.folderName+' [${imageBean.files.length}]'),
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
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Center(
        child: InkWell(
          onTap: () {
            navigationPush(context, FullImage(null,File(imageFiles), imageFiles));
          },
          child:  Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(4, 4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                children: <Widget>[
                   Hero(
                     tag: imageFiles,
                     child: Image.file(File(imageFiles),
                          width: double.infinity,
                          height: index % 2 == 0 ? 180 : 130, fit: BoxFit.cover),
                   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
