import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_image_bean.dart';
import 'package:flutterbeginner/view/local/image/full_image.dart';
import 'package:flutterbeginner/view/widgets/image_tile.dart';

class ImageFolder extends StatefulWidget {
  DeviceImageBean imageBean;
  ImageFolder(this.imageBean);
  @override
  State<ImageFolder> createState() => _ImageFolderState(imageBean);
}

class _ImageFolderState extends State<ImageFolder> {
  BuildContext? ctx;
  DeviceImageBean imageBean;
  _ImageFolderState(this.imageBean);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context, title:'${imageBean.folderName!} [${imageBean.files?.length}]'),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return Container(
      alignment: Alignment.center,
      child: GridView.builder(
        itemCount: imageBean.files?.length,
        itemBuilder: (BuildContext context, int index) {
          return getImageRow(imageBean.files![index], index);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5 / 1.8,
        ),

      ));
  }
  Widget getImageRow(String imageFiles, int index) {
    return InkWell(
      onTap: ()=>navigationPush(context, FullImage(null,File(imageFiles), imageFiles)),
      child: Card(
          color: ColorConst.GREY_COLOR,
          child: Padding(
              padding: const EdgeInsets.all(1.0),child:ImageTile(imageFiles))),
    );
  }

}
