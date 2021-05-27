import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

typedef SwitchOnChange = Function(int);

class TagScreen extends StatefulWidget {
  SwitchOnChange onChange;

  TagScreen({this.onChange});

  @override
  _TagScreenState createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  GlobalKey key = GlobalKey();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100)).then((v) {
      controller = AnimationController(
          vsync: this, duration: Duration(milliseconds: 300));

      tabWidth = key.currentContext.size.width / 2;
      // var width = (media.size.width - (2 * media.padding.left)) / 2;
      animation = Tween<double>(begin: 0, end: tabWidth).animate(controller);

      setState(() {});

      controller.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  var selectedValue = 0;
  double tabWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(
            ctx: context, title: StringConst.LOCAL_JSON_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      placeTag(),
    ]);
  }

  Widget placeTag() {
    return InkWell(
      onTap: () {
        selectedValue == 0 ? this.controller.forward() : controller.reverse();
        selectedValue = selectedValue == 0 ? 1 : 0;
      },
      child: Container(
        key: key,
        height: 44,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(22)),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(animation?.value ?? 0, 0),
                  child: Container(
                    height: 44,
                    width: tabWidth,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 3),
                        ]),
                  ),
                ),
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: tabWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.directions_walk),
                        SizedBox(width: 5),
                        Text("Place Bid")
                      ],
                    ),
                  ),
                  Container(
                    width: tabWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.directions_walk),
                        SizedBox(width: 5),
                        Text("Buy now")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
