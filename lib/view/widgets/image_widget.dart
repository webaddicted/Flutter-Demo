import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ImageWidget extends StatefulWidget {
  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  late BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context,title: StringConst.IMAGE_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
        const SizedBox(height: 10),
        _getClipImg(),
        const SizedBox(height: 10),
        SizedBox(height: 150, child: loadImg(ApiConstant.DEMO_IMG, 0)),
        const SizedBox(height: 10),
        loadCircleImg(ApiConstant.DEMO_IMG, 0, 120),
        const SizedBox(height: 10),
        SizedBox(height: 80, child: Image.asset(AssetsConst.logoImg)),
        const SizedBox(height: 10),
        const SizedBox(
            height: 150,
            child: Image(
                image: AssetImage(AssetsConst.babyImg), fit: BoxFit.cover)),
        const SizedBox(height: 10),
        FadeInImage.assetNetwork(
            placeholder: AssetsConst.logoImg,
            image: ApiConstant.DEMO_IMG,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover),
        const SizedBox(height: 10),
//        FadeInImage.memoryNetwork(
//          placeholder: ,
//          image: ApiConstant.DEMO_IMG,
//          height: 200,
//          width: double.infinity,
//          fit: BoxFit.cover,
//        ),
        const SizedBox(height: 10),
        _getWaveImg(),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _getWaveImg() {
    return ClipPath(
      clipper: MyClipper(),
      child: Image.network(ApiConstant.DEMO_IMG),
    );
  }
  Widget _getClipImg(){
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: ImagePath(),
          child: Image.network(
            "https://www.benq.com/content/dam/b2c/en/knowledge-center/unsure-about-projection-colors,color-gamut,or-wheel/unsure-about-projection-colors,color-gamut,or-wheel-800.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 170, left: 10),
          child: FloatingActionButton(
            backgroundColor: Colors.redAccent, onPressed: () {

          },
            child: const Icon(Icons.play_arrow),
          ),
        ),
      ],
    );
  }

}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class ImagePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // TODO: implement getClip
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

