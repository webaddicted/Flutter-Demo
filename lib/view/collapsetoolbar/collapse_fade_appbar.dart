import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';

class CollapseFadeAppBar extends StatefulWidget {
  @override
  _CollapseFadeAppBarState createState() => _CollapseFadeAppBarState();
}

class _CollapseFadeAppBarState extends State<CollapseFadeAppBar> {
  AppBarWidget appBar;
  ScrollController scrollController;
  PositionedBtnWidget roundLeftBtn;
  PositionedBtnWidget rectLeftBtn;

  BuildContext _ctx;

  @override
  void initState() {
    super.initState();
    appBar = AppBarWidget();
    scrollController = ScrollController();
    roundLeftBtn = PositionedBtnWidget(
      btnTop: 34,
      left: 20,
      opacity: 1,
      image: AssetsConst.BABY_IMG,
      actionFunction: () {
        Navigator.pop(_ctx);
        print('round left');
      },
    );
    rectLeftBtn = PositionedBtnWidget(
      btnTop: 34,
      left: 20,
      opacity: 0,
      image: AssetsConst.BABY_IMG,
      actionFunction: () {
        print('rect left');
      },
    );
  }

  double maxOffset = 80.0;

  scrollViewDidScrolled(double offSet) {
    //print('scroll offset ' + offSet.toString());

    ///appbar 透明度
    double appBarOpacity = offSet / maxOffset;
    double halfPace = maxOffset / 2.0;

    ///圆形按钮透明度
    double roundOpacity = (halfPace - offSet) / halfPace;

    ///方形按钮透明度
    double rectOpacity = (offSet - halfPace) / halfPace;

    if (appBarOpacity < 0) {
      appBarOpacity = 0.0;
    } else if (appBarOpacity > 1) {
      appBarOpacity = 1.0;
    }

    if (roundOpacity < 0) {
      roundOpacity = 0.0;
    } else if (roundOpacity > 1) {
      roundOpacity = 1;
    }

    if (rectOpacity < 0) {
      rectOpacity = 0.0;
    } else if (rectOpacity > 1) {
      rectOpacity = 1.0;
    }
    //print('roundOpacity $roundOpacity rectOpacity $rectOpacity');

    ///更新透明度
    if (appBar != null && appBar.updateAppBarOpacity != null) {
      appBar.updateAppBarOpacity(appBarOpacity);
    }

    if (roundLeftBtn != null && roundLeftBtn.updateOpacity != null) {
      roundLeftBtn.updateOpacity(roundOpacity);
    }
    if (rectLeftBtn != null && rectLeftBtn.updateOpacity != null) {
      rectLeftBtn.updateOpacity(rectOpacity);
    }
  }

  @override
  Widget build(BuildContext context) {
    double bottomBarHeight = MediaQuery.of(context).padding.bottom;
    bottomBarHeight += 49;
_ctx = context;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification &&
                    notification.depth == 0) {
                  scrollViewDidScrolled(notification.metrics.pixels);
                }
                return true;
              },
              child: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  SliverFixedExtentList(
                    itemExtent: 80,
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        // 创建列表项
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: Text('list item $index'),
                        );
                      },
                      // 50个列表项
                      childCount: 50,
                    ),
                  )
                ],
              ),
            ),
            appBar,
            rectLeftBtn,
            roundLeftBtn,
          ],
        ),
        bottomNavigationBar: Container(
            color: Colors.orange,
            height: bottomBarHeight,
            child: Center(
              child: Text('bottom bar'),
            )));
  }
}

///按钮
// ignore: must_be_immutable
class PositionedBtnWidget extends StatefulWidget {
  double btnTop;
  double right;
  double left;
  String image;
  double opacity;
  Function updateOpacity;

  Function actionFunction;

  PositionedBtnWidget(
      {this.btnTop,
        this.right,
        this.left,
        this.opacity,
        this.image,
        this.actionFunction});

  @override
  State<StatefulWidget> createState() {
    return PositionedBtnState();
  }
}

class PositionedBtnState extends State<PositionedBtnWidget> {
  double btnTop;
  double right;
  double left;
  String image;
  double btnOpacity;

  @override
  void initState() {
    super.initState();

    if (widget != null) {
      btnTop = widget.btnTop != null ? widget.btnTop : null;
      right = widget.right != null ? widget.right : null;
      left = widget.left != null ? widget.left : null;
      image = widget.image != null ? widget.image : null;
      btnOpacity = widget.opacity != null ? widget.opacity : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    ///更新透明度
    if (widget != null && widget.updateOpacity == null) {
      widget.updateOpacity = (double opacity) {
        setState(() {
          btnOpacity = opacity;
        });
      };
    }

    return Positioned(
      top: btnTop,
      right: right,
      left: left,
      child: Opacity(
        opacity: btnOpacity,
        child: IconButton(
          icon: Image.asset(image),
          onPressed: () {
            if (widget != null && widget.actionFunction != null) {
              widget.actionFunction();
            }
          },
        ),
      ),
    );
  }
}

///app barb
class AppBarWidget extends StatefulWidget {
  Function updateAppBarOpacity;

  @override
  State<StatefulWidget> createState() => AppBarState();
}

class AppBarState extends State<AppBarWidget> {
  double opacity = 0;

  @override
  void initState() {
    if (widget != null) {
      print('AppBarState init');
      widget.updateAppBarOpacity = (double op) {
        setState(() {
          opacity = op;
        });
      };
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).padding.top;
    appBarHeight += 52;

    return Opacity(
      opacity: opacity,
      child: Container(
        height: appBarHeight,
        child: AppBar(
          title: Text('app bar'),
          backgroundColor: Colors.deepOrange,
        ),
      ),
    );
  }
}
