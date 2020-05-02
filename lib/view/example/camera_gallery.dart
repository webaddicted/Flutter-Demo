import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
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
      appBar: getAppBar(context, StringConst.IMAGE_PICKER_TITLE),
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
                  imageURI == null
                      ? Text('No image selected.')
                      : Image.file(imageURI,
                      width: 300, height: 200, fit: BoxFit.cover),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: RaisedButton(
                        onPressed: () => getImageFromCamera(),
                        child: Text('Capture Image'),
                        textColor: Colors.white,
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: RaisedButton(
                        onPressed: () => getImageFromGallery(),
                        child: Text('Select Image From Gallery'),
                        textColor: Colors.white,
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      ))
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
}
