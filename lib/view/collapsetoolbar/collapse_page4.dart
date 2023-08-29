import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/example/movie_list_screen.dart';

class CollapsePage4 extends StatefulWidget {
  @override
  _CollapsePage4State createState() => _CollapsePage4State();
}

class _CollapsePage4State extends State<CollapsePage4> {
  ScrollController _scrollController = ScrollController();
  late Color appBarBackground;
  late double topPosition;

  @override
  void initState() {
    topPosition = -80;
    appBarBackground = Colors.transparent;
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  double _getOpacity() {
    double op = (topPosition + 80) / 80;
    return op > 1 || op < 0 ? 1 : op;
  }

  _onScroll() {
    if (_scrollController.offset > 50) {
      if (topPosition < 0)
        setState(() {
          topPosition = -130 + _scrollController.offset;
          if (_scrollController.offset > 130) topPosition = 0;
        });
    } else {
      if (topPosition > -80)
        setState(() {
          topPosition--;
          if (_scrollController.offset <= 0) topPosition = -80;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 50),
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30.0)),
                    color: ColorConst.appColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 70),
                      getTxtWhiteColor(
                          msg: StringConst.DEEPAK_SHARMA,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                      const SizedBox(height: 10.0),
                      getTxtWhiteColor(
                        msg: StringConst.WEBADDICTED,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
                MovieListItem(),
              ],
            ),
          ),
          Positioned(
              top: topPosition,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                padding:
                    const EdgeInsets.only(left: 50, top: 25.0, right: 20.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30.0)),
                  color: Colors.white.withOpacity(_getOpacity()),
                ),
                child: DefaultTextStyle(
                  style: TextStyle(),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  child: Semantics(
                    child: Text(
                      'Simple app bar animation test',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    header: true,
                  ),
                ),
              )),
          SizedBox(
            height: 80,
            child: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: ColorConst.whiteColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
