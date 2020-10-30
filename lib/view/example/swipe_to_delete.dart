import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class SwipeToDelete extends StatefulWidget {
  @override
  _SwipeToDeleteState createState() => _SwipeToDeleteState();
}

class _SwipeToDeleteState extends State<SwipeToDelete> {
  BuildContext _ctx;
  List dataResult;

  @override
  void initState() {
    super.initState();
    dataResult = List();
    dataResult.add('Item : 1');
    dataResult.add('Item : 2');
    dataResult.add('Item : 3');
    dataResult.add('Item : 4');
    dataResult.add('Item : 5');
    dataResult.add('Item : 6');
    dataResult.add('Item : 7');
    dataResult.add('Item : 8');
    dataResult.add('Item : 9');
    dataResult.add('Item : 10');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.SWIPE_TO_DELETE_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          onPressed: () {
            dataResult.add('Item : ' + (dataResult.length + 1).toString());
            setState(() {});
          }),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    return new Center(
      child: new ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return OnSlide(
            items: <ActionItems>[
              ActionItems(
                  icon: new IconButton(
                    icon: new Icon(Icons.share),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  onPress: () {},
                  backgroudColor: Colors.blue),
              ActionItems(
                  icon: new IconButton(
                    icon: new Icon(Icons.save),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  onPress: () {},
                  backgroudColor: Colors.green),
              ActionItems(
                  icon: new IconButton(
                    icon: new Icon(Icons.delete),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  onPress: () {},
                  backgroudColor: Colors.red),
            ],
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 5, right: 5, bottom: 5),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getTxtBlackColor(
                      msg: "This is a demo card",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  getTxtBlackColor(
                    msg: StringConst.DUMMY_TEXT,
                    fontSize: 16,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 10, separatorBuilder: (BuildContext context, int index) { return getDivider(); },
      ),
    );
  }

  Widget createRow(int index) {
    return Container(
      child: Card(
        child: Dismissible(
          key: Key(dataResult[index]),
          onDismissed: (direction) {
            dataResult.removeAt(index);
            showSnackBar(_ctx, 'Item dismissed.');
          },
          background: Container(
            color: Colors.red,
          ),
          child: Container(
              padding: EdgeInsets.all(20),
              child: getTxt(msg: dataResult[index])),
        ),
      ),
    );
  }
}

typedef void SizeChangedCallBack(Size newSize);

class LayoutSizeChangeNotification extends LayoutChangedNotification {
  LayoutSizeChangeNotification(this.newSize) : super();
  Size newSize;
}

/// A widget that automatically dispatches a [SizeChangedLayoutNotification]
/// when the layout dimensions of its child change.
///
/// The notification is not sent for the initial layout (since the size doesn't
/// change in that case, it's just established).
///
/// To listen for the notification dispatched by this widget, use a
/// [NotificationListener<SizeChangedLayoutNotification>].
///
/// The [Material] class listens for [LayoutChangedNotification]s, including
/// [SizeChangedLayoutNotification]s, to repaint [InkResponse] and [InkWell] ink
/// effects. When a widget is likely to change size, wrapping it in a
/// [SizeChangedLayoutNotifier] will cause the ink effects to correctly repaint
/// when the child changes size.
///
/// See also:
///
///  * [Notification], the base class for notifications that bubble through the
///    widget tree.
class LayoutSizeChangeNotifier extends SingleChildRenderObjectWidget {
  /// Creates a [SizeChangedLayoutNotifier] that dispatches layout changed
  /// notifications when [child] changes layout size.
  const LayoutSizeChangeNotifier({Key key, Widget child})
      : super(key: key, child: child);

  @override
  _SizeChangeRenderWithCallback createRenderObject(BuildContext context) {
    return new _SizeChangeRenderWithCallback(onLayoutChangedCallback: (size) {
      new LayoutSizeChangeNotification(size).dispatch(context);
    });
  }
}

class _SizeChangeRenderWithCallback extends RenderProxyBox {
  _SizeChangeRenderWithCallback(
      {RenderBox child, @required this.onLayoutChangedCallback})
      : assert(onLayoutChangedCallback != null),
        super(child);

  // There's a 1:1 relationship between the _RenderSizeChangedWithCallback and
  // the `context` that is captured by the closure created by createRenderObject
  // above to assign to onLayoutChangedCallback, and thus we know that the
  // onLayoutChangedCallback will never change nor need to change.

  final SizeChangedCallBack onLayoutChangedCallback;

  Size _oldSize;

  @override
  void performLayout() {
    super.performLayout();
    // Don't send the initial notification, or this will be SizeObserver all
    // over again!
    if (size != _oldSize) onLayoutChangedCallback(size);
    _oldSize = size;
  }
}

class ActionItems extends Object {
  ActionItems(
      {@required this.icon,
      @required this.onPress,
      this.backgroudColor: Colors.grey}) {
    assert(icon != null);
    assert(onPress != null);
  }

  final Widget icon;
  final VoidCallback onPress;
  final Color backgroudColor;
}

class OnSlide extends StatefulWidget {
  OnSlide(
      {Key key,
      @required this.items,
      @required this.child,
      this.backgroundColor: Colors.white})
      : super(key: key) {
    assert(items.length <= 6);
  }

  final List<ActionItems> items;
  final Widget child;
  final Color backgroundColor;

  @override
  State<StatefulWidget> createState() {
    return new _OnSlideState();
  }
}

class _OnSlideState extends State<OnSlide> {
  ScrollController controller = new ScrollController();
  bool isOpen = false;

  Size childSize;

  @override
  void initState() {
    super.initState();
  }

  bool _handleScrollNotification(dynamic notification) {
    if (notification is ScrollEndNotification) {
      if (notification.metrics.pixels >= (widget.items.length * 70.0) / 2 &&
          notification.metrics.pixels < widget.items.length * 70.0) {
        scheduleMicrotask(() {
          controller.animateTo(widget.items.length * 60.0,
              duration: new Duration(milliseconds: 600),
              curve: Curves.decelerate);
        });
      } else if (notification.metrics.pixels > 0.0 &&
          notification.metrics.pixels < (widget.items.length * 70.0) / 2) {
        scheduleMicrotask(() {
          controller.animateTo(0.0,
              duration: new Duration(milliseconds: 600),
              curve: Curves.decelerate);
        });
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (childSize == null) {
      return new NotificationListener(
        child: new LayoutSizeChangeNotifier(
          child: widget.child,
        ),
        onNotification: (LayoutSizeChangeNotification notification) {
          childSize = notification.newSize;
          print(notification.newSize);
          scheduleMicrotask(() {
            setState(() {});
          });
        },
      );
    }

    List<Widget> above = <Widget>[
      new Container(
        width: childSize.width,
        height: childSize.height,
        color: widget.backgroundColor,
        child: widget.child,
      ),
    ];
    List<Widget> under = <Widget>[];

    for (ActionItems item in widget.items) {
      under.add(new Container(
        alignment: Alignment.center,
        color: item.backgroudColor,
        width: 60.0,
        height: childSize.height,
        child: item.icon,
      ));

      above.add(new InkWell(
          child: new Container(
            alignment: Alignment.center,
            width: 60.0,
            height: childSize.height,
          ),
          onTap: () {
            controller.jumpTo(2.0);
            item.onPress();
          }));
    }

    Widget items = new Container(
      width: childSize.width,
      height: childSize.height,
      color: widget.backgroundColor,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: under,
      ),
    );

    Widget scrollview = new NotificationListener(
      child: new ListView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: above,
      ),
      onNotification: _handleScrollNotification,
    );

    return new Stack(
      children: <Widget>[
        items,
        new Positioned(
          child: scrollview,
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          top: 0.0,
        )
      ],
    );
  }
}
