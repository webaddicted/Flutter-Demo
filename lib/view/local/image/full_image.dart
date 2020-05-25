import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/utils/file_utils.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_image_bean.dart';
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
      appBar: getAppBarWithBackBtn(context, name),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: getImageView());
  }

  Widget getImageView() {
    if (imageFile != null) {
      return Image.file(imageFile, fit: BoxFit.cover);
    } else {
      return PhotoView(
          imageProvider: NetworkImage(
        imageUrl
      ));
      // Contained = the smallest possible size to fit one dimension of the screen
//      minScale: PhotoViewComputedScale.contained * 0.8,
    // Covered = the smallest possible size to fit the whole screen
//    maxScale: PhotoViewComputedScale.covered * 2,
    }
  }
}
