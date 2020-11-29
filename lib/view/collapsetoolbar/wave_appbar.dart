import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
// import 'package:wave/config.dart';
// import 'package:wave/wave.dart';

class WaveAppbar extends StatefulWidget {
  @override
  _WaveAppbarState createState() => _WaveAppbarState();
}

class _WaveAppbarState extends State<WaveAppbar> {
  static IconData backIcon(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        primary: false,
        appBar: PreferredSize(
          preferredSize: Size(400, 400),
          child: SafeArea(
              child: Container(
            color: Theme.of(context).primaryColor,
            width: MediaQuery.of(context).size.width,
            // Set Appbar wave height
            child: Container(
              height: 80,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      RotatedBox(
                          quarterTurns: 2,
                          child: Container()
                          // WaveWidget(
                          //   config: CustomConfig(
                          //     colors: [Theme.of(context).primaryColor],
                          //     durations: [22000],
                          //     heightPercentages: [-0.1],
                          //   ),
                          //   size: Size(double.infinity, double.infinity),
                          //   waveAmplitude: 1,
                          // )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) => IconButton(
                              icon: new Icon(backIcon(context),
                                  color: Colors.white),
                              onPressed: () => print("It's Back Button"),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                StringConst.APP_NAME,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                        ],
                      ),
                      Positioned(
                        top: 6.0,
                        right: 6.0,
                        child: Theme(
                            data: Theme.of(context).copyWith(
                              cardColor: Theme.of(context).primaryColor,
                            ),
                            child: PopupMenuButton(
                                elevation: 4.0,
                                initialValue: activePopMenu,
                                onSelected: (value) {},
                                itemBuilder: (context) {
                                  return getChildPopUpWidgets(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: 10, left: 5),
                                        child: Icon(Icons.brightness_1,
                                            size: 12, color: Colors.white),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          activePopMenu.title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                ))),
                      ),
                    ],
                  )),
            ),
          )),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Awesome Wave AppBar',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

              _buildCard(
                backgroundColor: Colors.purpleAccent,
                // config: CustomConfig(
                //   gradients: [
                //     [Colors.red, Color(0xEEF44336)],
                //     [Colors.red[800], Color(0x77E57373)],
                //     [Colors.orange, Color(0x66FF9800)],
                //     [Colors.yellow, Color(0x55FFEB3B)]
                //   ],
                //   durations: [35000, 19440, 10800, 6000],
                //   heightPercentages: [0.20, 0.23, 0.25, 0.30],
                //   blur: _blur,
                //   gradientBegin: Alignment.bottomLeft,
                //   gradientEnd: Alignment.topRight,
                // ),
              ),
              _buildCard(
                height: 256.0,
                backgroundImage: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
                  ),
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.white, BlendMode.softLight),
                ),
                // config: CustomConfig(
                //   colors: [
                //     Colors.pink[400],
                //     Colors.pink[300],
                //     Colors.pink[200],
                //     Colors.pink[100]
                //   ],
                //   durations: [18000, 8000, 5000, 12000],
                //   heightPercentages: [0.85, 0.86, 0.88, 0.90],
                //   blur: _blur,
                // ),
              ),
              // _buildCard(
              //     config: CustomConfig(
              //       colors: [
              //         Colors.white70,
              //         Colors.white54,
              //         Colors.white30,
              //         Colors.white24,
              //       ],
              //       durations: [32000, 21000, 18000, 5000],
              //       heightPercentages: [0.25, 0.26, 0.28, 0.31],
              //       blur: _blur,
              //     ),
              //     backgroundColor: Colors.blue[600]),
            ]),
          ),
        ));
  }
  _buildCard({
    // Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage backgroundImage,
    double height = 152.0,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      child: Card(
        elevation: 12.0,
        margin: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Container()
        // WaveWidget(
        //   config: config,
        //   backgroundColor: backgroundColor,
        //   // backgroundImage: backgroundImage,
        //   size: Size(double.infinity, double.infinity),
        //   waveAmplitude: 0,
        // ),
      ),
    );
  }

  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;
  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }
}

List<PopMenuItem> getPopMenus() {
  List<PopMenuItem> popMenus = new List();
  popMenus.add(PopMenuItem(title: "Awesome", id: 1));
  popMenus.add(PopMenuItem(title: "Wave", id: 2));
  return popMenus;
}

PopMenuItem activePopMenu = getPopMenus()[0];

List<PopupMenuEntry<Object>> getChildPopUpWidgets(BuildContext context) {
  var childrenPopMenu = List<PopupMenuEntry<Object>>();
  for (PopMenuItem popUpMenu in getPopMenus()) {
    childrenPopMenu.add(PopupMenuItem(
      value: popUpMenu.id,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.brightness_1,
                  size: 12,
                  color: popUpMenu.id == activePopMenu.id
                      ? Colors.white
                      : Colors.transparent),
            ),
            Container(
              width: 90,
              child: Text(
                popUpMenu.title,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    ));
  }
  return childrenPopMenu;
}

class PopMenuItem {
  String title;
  int id;

  PopMenuItem({this.title, this.id});

  PopMenuItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    return data;
  }

}
