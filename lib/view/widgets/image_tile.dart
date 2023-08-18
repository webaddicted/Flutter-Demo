import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math' as math show Random;

import 'package:flutterbeginner/global/utils/widget_helper.dart';
class ImageTile extends StatelessWidget {
   String image;
   int index=-1;
   double height=-1;
   ImageTile(this.image,{ this.index = -1, this.height = -1});
  @override
  Widget build(BuildContext context) => addRoundedCorners(getImage(image));

  Widget getImage(String image) {
    if (image == null || image.isEmpty) {
      return _buildImageErrorWidget();
    }else if (image.contains("http")) {
      return loadImg(image, 0);
    } else {
      if (height > 0 && index > -1) {
        height = index % 2 == 0 ? height : 130;
      } else if (height > 0) {
        height = height;
      } else if (index > -1) {
        height = index % 2 == 0 ? 180 : 130;
      } else {
        height = double.infinity;
      }
      return Image.file(File(image),
          width: double.infinity, height: height, fit: BoxFit.cover);
    }
  }

  Widget _buildImagePlaceholder()=> Container(
      color: Colors.primaries[math.Random().nextInt(Colors.primaries.length)]
    );

  Widget _buildImageErrorWidget() => Container(
        color: Colors.blue[200],
        child: Center(
            child: Icon(
          Icons.broken_image,
          color: Colors.blue[400],
        )),
      );
}
