import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_image_bean.dart';
import 'package:flutterbeginner/view/local/image/image_folder.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  BuildContext _ctx;
  var listData = List<DeviceImageBean>();

  @override
  void initState() {
    super.initState();
    getAllImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.ALL_IMAGE_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            getAllImage();
          }),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.length == 0) return showPbIndicator(true);
    return new Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return allImageRow(listData[index], index);
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(3),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }

  Widget allImageRow(DeviceImageBean imageBean, int index) {
    return GestureDetector(
      onTap: () {
        navigationPush(context, ImageFolder(imageBean));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Image.file(File(imageBean.files[0]),
                height: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: getTxtBlackCenterColor(
                  imageBean.folderName + ' [${imageBean.files.length}]',
                  15,
                  FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void getAllImage() async {
    if (listData != null) listData.clear();
    String imagePath = '';//await StoragePath.imagesPath;
    var response = jsonDecode(imagePath);
    var imageList = response as List;
    listData =
    imageList.map<DeviceImageBean>((json) => DeviceImageBean.fromJson(json)).toList();
    setState(() {});
  }

  List<StaggeredTile> generateRandomTiles(int count) {
    Random rnd = new Random();
    List<StaggeredTile> _staggeredTiles = [];
    for (int i = 0; i < count; i++) {
      num mainAxisCellCount = 0;
      double temp = rnd.nextDouble();

      if (temp > 0.6) {
        mainAxisCellCount = temp + 0.5;
      } else if (temp < 0.3) {
        mainAxisCellCount = temp + 0.9;
      } else {
        mainAxisCellCount = temp + 0.7;
      }
      _staggeredTiles
          .add(new StaggeredTile.count(rnd.nextInt(1) + 1, mainAxisCellCount));
    }
    return _staggeredTiles;
  }
}
