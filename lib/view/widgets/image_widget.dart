import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ImageWidget extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.IMAGE_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        padding: EdgeInsets.all(5.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                _getImageType(),
              ],
            ),
          ),
        ));
  }

  Widget _getImageType() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(height: 150, child: loadImg(ApiConst.DEMO_IMG, 0)),
        SizedBox(height: 10),
        loadCircleImg(ApiConst.DEMO_IMG, 0, 120),
        SizedBox(height: 10),
        Container(height: 80, child: Image.asset(AssetsConst.LOGO_IMG)),
        SizedBox(height: 10),
        Container(
            height: 150,
            child: Image(
                image: AssetImage(AssetsConst.BABY_IMG), fit: BoxFit.cover)),
        SizedBox(height: 10),
        FadeInImage.assetNetwork(
            placeholder: AssetsConst.LOGO_IMG,
            image: ApiConst.DEMO_IMG,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover),
        SizedBox(height: 10),
//        FadeInImage.memoryNetwork(
//          placeholder: ,
//          image: ApiConstant.DEMO_IMG,
//          height: 200,
//          width: double.infinity,
//          fit: BoxFit.cover,
//        ),
        SizedBox(height: 10),
      ],
    );
  }
}
