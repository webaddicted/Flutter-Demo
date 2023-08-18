import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/sifi_movie_row.dart';

class ProfilePage5 extends StatefulWidget {
  @override
  State<ProfilePage5> createState() => _ProfilePage5State();
}

class _ProfilePage5State extends State<ProfilePage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 380,
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
              ),
            ),
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 380,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(ApiConstant.WEBADDICTED_IMG),
                    fit: BoxFit.cover),
              ),
              foregroundDecoration:
                  BoxDecoration(color: Colors.orange.withOpacity(0.8)),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              const SizedBox(height: 90),
              _buildAvatar(ApiConstant.WEBADDICTED_IMG),
              const SizedBox(height: 10.0),
              Text(
                StringConst.DEEPAK_SHARMA,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    !.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Flutter & Full Stack Developer",
                style: TextStyle(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              Card(
                color: Colors.white,
                elevation: 3,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 25.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            getTxtBlackColor(
                              msg: "255K",
                              fontSize: 17,
                            ),
                            const SizedBox(height: 5.0),
                            getTxtBlackColor(
                              msg: "Followers",
                              fontSize: 17,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            getTxtBlackColor(
                              msg: "105K",
                              fontSize: 17,
                            ),
                            const SizedBox(height: 5.0),
                            getTxtBlackColor(msg: "Following", fontSize: 17),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              getTxtBlackColor(
                msg: "Friends",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Stack(
                  children: [
                    ...dummyImgList
                        .asMap()
                        .map(
                          (i, e) => MapEntry(
                            i,
                            Transform.translate(
                              offset: Offset(i * 20.0, 0),
                              child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: _buildAvatar(e, radius: 20)),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ],
                ),
              ),
              SifiMovieRow('Action Movie')
            ],
          )
        ],
      ),
      // floatingActionButton: AnimatedFloatingActionButton(
      //   fabButtons: _buildFloatingButtons(),
      //   colorStartAnimation: Colors.indigo,
      //   colorEndAnimation: Colors.red,
      //   animatedIconData: AnimatedIcons.menu_close,
      // ),
    );
  }

  CircleAvatar _buildAvatar(String image, {double radius = 80}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 2,
        backgroundImage: NetworkImage(image),
      ),
    );
  }

  List<Widget> _buildFloatingButtons() {
    return <Widget>[
      FloatingActionButton(
        heroTag: "copy",
        tooltip: 'Copy code link to clipboard',
        onPressed: () async {
          await Clipboard.setData(
              const ClipboardData(text: 'https://www.github.com/webaddicted/'));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Code link copied to Clipboard!'),
          ));
        },
        child: const Icon(Icons.content_copy),
      ),
      FloatingActionButton(
        heroTag: "open",
        tooltip: 'View code on github',
        onPressed: () {},
        child: const Icon(Icons.open_in_new),
      ),
      FloatingActionButton(
        heroTag: "zoom_out",
        tooltip: 'Zoom out',
        onPressed: () => setState(() {
          // this._textScaleFactor = max(0.8, this._textScaleFactor - 0.1);
        }),
        child: const Icon(Icons.zoom_out),
      ),
      FloatingActionButton(
        heroTag: "zoom_in",
        tooltip: 'Zoom in',
        onPressed: () => setState(() {
          // this._textScaleFactor += 0.1;
        }),
        child: const Icon(Icons.zoom_in),
      ),
    ];
  }
}

class OvalBottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
