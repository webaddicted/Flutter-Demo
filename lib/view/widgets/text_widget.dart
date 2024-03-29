import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/alltask/code_preview.dart';

class TextWidget extends StatefulWidget {
  var path;

  TextWidget(this.path);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String _btnText = "Hello World";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            getAppBarWithBackBtn(ctx: context, title: StringConst.TEXT_TITLE),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () =>
        //     navigationPush(
        //         context,
        //         CodePreviewsPage(
        //           title: StringConst.TEXT_TITLE,
        //           path: widget.path,
        //         ))
        //   ,
        //   child: Icon(Icons.code, color: Colors.white),
        // ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(5.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                _getTextType(),
              ],
            ),
          ),
        ));
  }

  Widget _getTextType() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          color: ColorConst.RED_COLOR,
          height: 50,
          alignment: Alignment.center,
          child: getTxtWhiteColor(
              msg: 'Text', fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(_btnText),
        SizedBox(height: 10),
        ExpansionTile(
          backgroundColor: ColorConst.GREY_BG_COLOR,
          title: getTxtBlackColor(
              msg: "Show Details", fontWeight: FontWeight.bold, fontSize: 18),
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(16.0),
              child: Text(StringConst.DUMMY_LAGE_TEXT),
            )
          ],
        ),
        SizedBox(height: 10),
        Container(
          color: ColorConst.GREEN_COLOR,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: getTxtWhiteColor(
                msg: StringConst.APP_NAME,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        getTxtBlackColor(msg: StringConst.APP_NAME, fontSize: 15),
        SizedBox(height: 10),
        getTxtGreyColor(
            msg: StringConst.DUMMY_TEXT,
            fontSize: 15,
            fontWeight: FontWeight.bold),
        SizedBox(height: 10),
        getTxtAppColor(
            msg: StringConst.APP_NAME,
            fontSize: 15,
            fontWeight: FontWeight.bold),
        SizedBox(height: 10),
        getTxtColor(
            msg: StringConst.APP_NAME,
            txtColor: ColorConst.GREEN_COLOR,
            fontSize: 15,
            fontWeight: FontWeight.bold),
        SizedBox(height: 10),
        Text(
          StringConst.DUMMY_TEXT,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            background: Paint()
              ..color = Color(0xffc7e5b4)
              ..style = PaintingStyle.fill,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "TextStyle with decoration underline",
          style: TextStyle(
              fontSize: 20,
              background: Paint()..color = Colors.lightGreenAccent,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy),
        ),
        SizedBox(height: 10),
        Text(
          StringConst.DUMMY_TEXT,
          style: TextStyle(
              fontSize: 20,
              background: Paint()..color = Colors.blueAccent,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.double),
        ),
        SizedBox(height: 10),
        Container(
          constraints: BoxConstraints.expand(height: 40),
          color: Colors.white,
          child: Text(
            "TextAlign end",
            style: TextStyle(background: Paint()..color = Colors.orangeAccent),
            textAlign: TextAlign.end,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Text.rich(
            TextSpan(children: [
              TextSpan(text: "By clicking Sign Up you agree to the following "),
              TextSpan(
                  text: "Terms and Conditions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.indigo)),
              TextSpan(text: " withour reservations."),
            ]),
          ),
        ),
      ],
    );
  }
}
