import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/local/image/full_image.dart';
import 'package:image_picker/image_picker.dart';

class CameraGallery extends StatefulWidget {
  @override
  _CameraGalleryState createState() => _CameraGalleryState();
}

class _CameraGalleryState extends State<CameraGallery> {
  File imageURI;
  BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context,title:StringConst.IMAGE_PICKER_TITLE),
      body: Builder(builder: (_context) {
        return _createUi(_context);
      }),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          GestureDetector(
            onTap: (){
              if(imageURI != null)
              navigationPush(context, FullImage(null, imageURI, imageURI));
            },
            child: imageURI == null
                ? Text('No image selected.')
                : Hero(tag:imageURI,
                  child: Image.file(imageURI,
                      width: 300, height: 200, fit: BoxFit.cover),
                ),
          ),
          RaisedButton(
            onPressed: () => getImageFromCamera(),
            child: Text('Capture Image'),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          ),
          RaisedButton(
            onPressed: () => getImageFromGallery(),
            child: Text('Select Image From Gallery'),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          ),
          RaisedButton(
            onPressed: () => imagePickDialog(context, selectedFileIs),
            child: Text('Select Option'),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          ),
        ])));
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageURI = image;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageURI = image;
    });
  }

  selectedFileIs(File image) {
    setState(() {
      imageURI = image;
    });
  }
}
