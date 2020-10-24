import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/file_utils.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:photo_view/photo_view.dart';

class FullImage extends StatefulWidget {
  String imageUrl;
  File imageFile;

//  FullImage({this.imageUrl, this.imageFile});
  FullImage(this.imageUrl, this.imageFile);

  @override
  _FullImageState createState() => _FullImageState(imageUrl, imageFile);
}

class _FullImageState extends State<FullImage> {
  BuildContext _ctx;
  String imageUrl;
  File imageFile;

  _FullImageState(this.imageUrl, this.imageFile);

  @override
  Widget build(BuildContext context) {
    String name = '';
    if (imageFile != null)
      name = getFileName(imageFile.path);
    else
      name = getFileName(imageUrl);
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context,title: name),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: getImageView());
  }

  Widget getImageView() {
    var imageFileProvider;
    if (imageFile != null)
      imageFileProvider = FileImage(imageFile);
    else
      imageFileProvider = NetworkImage(imageUrl);
    return PhotoView(
      imageProvider: imageFileProvider,
      minScale: PhotoViewComputedScale.contained * 0.8,
      maxScale: PhotoViewComputedScale.covered * 2,
      enableRotation: true,
    );
  }
}
