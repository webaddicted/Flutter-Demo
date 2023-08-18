
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class NavBackDropDrawer extends StatefulWidget {
  @override
  _NavBackDropDrawerState createState() => _NavBackDropDrawerState();
}

class _NavBackDropDrawerState extends State<NavBackDropDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool _isBackpanelVisible() {
    final AnimationStatus status = _controller.status;

    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backdrop"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _controller.fling(velocity: _isBackpanelVisible() ? -1.0 : 1.0);
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _controller.view,
          ),
        ),
      ),
      body: MainActivity(_controller),
    );
  }
}

class MainActivity extends StatefulWidget {
  final AnimationController _controller;

  MainActivity(this._controller);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  static const _headerHeight = 40.0;

  static var _superHero = "CaptainAmerica";

  bool _isBackpanelVisible() {
    final AnimationStatus status = widget._controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void animate(String hero) {
    setState(() {
      _superHero = hero;
    });
    widget._controller.fling(velocity: _isBackpanelVisible() ? -1.0 : 1.0);
  }

  void _backViewOnClick(int position) {
    switch (position) {
      case 0:
        animate("Captain America");
        break;
      case 1:
        animate("Iron Man");
        break;
      case 2:
        animate("Thor");
        break;
      case 3:
        animate("Hulk");
        break;

      default:
    }
  }

  Widget activityContainer(BuildContext context, BoxConstraints constraint) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        Container(
          color: theme.primaryColor,
          child: Center(
            child: Column(
              children: <Widget>[
                MaterialButton(
                  onPressed: () => _backViewOnClick(0),
                  child:
                      getTxtWhiteColor(msg: "Captain America", fontSize: 30),
                ),
                MaterialButton(
                  onPressed: () => _backViewOnClick(1),
                  child: getTxtWhiteColor(
                    fontSize: 30,
                    msg: "Iron Man",
                  ),
                ),
                MaterialButton(
                  onPressed: () => _backViewOnClick(2),
                  child: getTxtWhiteColor(
                    fontSize: 30,
                    msg: "Thor",
                  ),
                ),
                MaterialButton(
                  onPressed: () => _backViewOnClick(3),
                  child: getTxtWhiteColor(
                    fontSize: 30,
                    msg: "Hulk",
                  ),
                )
              ],
            ),
          ),
        ),
        PositionedTransition(
          rect: _getActivityAnimation(constraint),
          child: Material(
            elevation: 16,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16)),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: _headerHeight,
                  child: Center(
                    child: Text(
                      "Marvel",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      _superHero,
                      style: const TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Animation<RelativeRect> _getActivityAnimation(BoxConstraints contraints) {
    final maxHeight = contraints.biggest.height;
    final backViewHeight = maxHeight - _headerHeight;
    const frontViewHeight = -_headerHeight;

    return RelativeRectTween(
            begin:
                RelativeRect.fromLTRB(0, backViewHeight, 0, frontViewHeight),
            end: const RelativeRect.fromLTRB(0, 0, 0, 0))
        .animate(
            CurvedAnimation(parent: widget._controller, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: activityContainer,
    );
  }
}
