import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/file_utils.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:photo_view/photo_view.dart';

class FullImage extends StatefulWidget {
  String? imageUrl;
  File? imageFile;
  var tag;
  FullImage(this.imageUrl, this.imageFile, this.tag);

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {

  @override
  Widget build(BuildContext context) {
    String name = '';
    if (widget.imageFile != null) {
      name = getFileName(widget.imageFile!.path);
    } else {
      name = getFileName(widget.imageUrl);
    }
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context,title: name),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    return Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Hero(tag: widget.tag,child: getImageView()));
  }

  Widget getImageView() {
    var imageFileProvider;
    if (widget.imageFile != null) {
      imageFileProvider = FileImage(widget.imageFile!);
    } else {
      imageFileProvider = NetworkImage(widget.imageUrl!);
    }
    return PhotoView(
      imageProvider: imageFileProvider,
      minScale: PhotoViewComputedScale.contained * 0.8,
      maxScale: PhotoViewComputedScale.covered * 2,
      enableRotation: true,
    );
  }
}
