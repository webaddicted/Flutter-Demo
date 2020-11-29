import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class CollapseArcPage2 extends StatefulWidget {
  @override
  _CollapseArcPage2State createState() => _CollapseArcPage2State();
}

class _CollapseArcPage2State extends State<CollapseArcPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.pink,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    child: Center(
                  child: getTxtColor(
                      msg: 'Arc toolbar',
                      txtColor: Colors.pink,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
                IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.pink,
                    ),
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
            expandedHeight: 370,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Hero(
                        tag: ApiConstant.WEBADDICTED_IMG,
                        child: ClipShadowPath(
                          shadow: Shadow(blurRadius: 30),
                          clipper: CustomOvalClipper(),
                          child: Image(
                            image: AssetImage(AssetsConst.BABY_IMG),
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: 0,
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54, blurRadius: 15)
                                ]),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.red,
                              size: 45,
                            )),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                onPressed: null),
                            IconButton(
                                icon: Icon(
                                  Icons.share,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                onPressed: null)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, position) {
                  return Column(
                    children: <Widget>[
                      buildMovieTitle(),
                      buildMovieCategoriesText(),
                      RatingBar.builder(
                        initialRating: 3,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                        ),
                        allowHalfRating: true,
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      buildCountryYearLengthOfMovie(),
                      buildMovieDescription(),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'ScreenShots',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: Icon(Icons.chevron_right), onPressed: () {  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 140, // : 180,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 20,
                              itemBuilder:
                                  (BuildContext context, int position) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      bottom: 10, top: 10, left: 16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black54,
                                            blurRadius: 10,
                                            offset: Offset(0, 1)),
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image:
                                          AssetImage(AssetsConst.DOWNLOAD_IMG),
                                      height: 140, // : 160,
                                      width: 180, // : 120,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
                childCount: 1,
              ),
              itemExtent: MediaQuery.of(context).size.height),
        ],
      ),
    );
  }

  buildMovieCategoriesText() {
    return Container(
      width: 200,
      height: 50,
      child: Center(
        child: Text(
          'Action',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  buildMovieTitle() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: 200,
      height: 50,
      child: Center(
        child: Text(
          'Spider-man: Far From Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  buildMovieDescription() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        StringConst.DUMMY_TEXT + StringConst.DUMMY_TEXT,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget buildCountryYearLengthOfMovie() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Year",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '2020',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "Country",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'USA',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                "Length",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '129 min',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
