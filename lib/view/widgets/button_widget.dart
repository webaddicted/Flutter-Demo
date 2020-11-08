import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/progress_button.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(ctx: context, title: StringConst.BUTTON_TITLE),
      body: Builder(
        builder: (context) => _createUi(context),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: 'hjshasj',
          child: Icon(Icons.refresh),
          onPressed: () {
            // _reqPermission();
          }),
      // floatingActionButton: AnimatedFloatingActionButton(
      //   fabButtons: _buildFloatingButtons(),
      //   colorStartAnimation: Colors.indigo,
      //   colorEndAnimation: Colors.red,
      //   animatedIconData: AnimatedIcons.menu_close,
      // ),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        child: Stack(
      children: [
        new Center(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                _getButtonType(),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          left: -20,
          child: Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 00,
          left: 00,
          child: IconButton(
            icon: Icon(
              FontAwesomeIcons.powerOff,
              color: Colors.white,
            ),
            onPressed: () {
              //log out
            },
          ),
        )
      ],
    ));
  }

  Widget _getButtonType() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        buildTextWithIcon(),
        SizedBox(height: 10),
        OutlineButton(
          child: new Text('Outline Button'),
          onPressed: () => showSnackBar(_ctx, 'Outline Button click'),
        ),
        SizedBox(height: 10),
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () => showSnackBar(_ctx, 'Icon Button click'),
        ),
        SizedBox(height: 10),
        RaisedButton(
          onPressed: () => showSnackBar(_ctx, 'Raised button click'),
          child: (Text('Raised button')),
          color: Colors.orangeAccent,
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () => showSnackBar(_ctx, 'Floating action Button click'),
          child: new Icon(Icons.add),
        ),
        SizedBox(height: 10),
        MaterialButton(
          height: 60,
          color: Colors.green,
          child: Icon(
            Icons.email,
            color: Colors.white,
          ),
          onPressed: () => showSnackBar(_ctx, 'Circle Button click'),
          padding: EdgeInsets.all(2),
          elevation: 2,
          shape: CircleBorder(side: BorderSide(color: Colors.deepOrange)),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Rounded Rectangle Border button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Rounded Rectangle Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.deepOrange, width: 2),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Rounded Rectangle Border button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Rounded Rectangle Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.green, width: 2),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Stadium Border button'),
          onPressed: () => showSnackBar(_ctx, 'Stadium Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.green, width: 2),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Beveled Rectangle Border button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Beveled Rectangle Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.green, width: 2),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Outline Input Border button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Outline Input Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orange, width: 2)),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Underline InputBorder button'),
          onPressed: () =>
              showSnackBar(_ctx, 'Underline InputBorder Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          textColor: Colors.white,
          color: Colors.cyanAccent,
          shape: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
            borderSide: BorderSide(color: Colors.orange, width: 3),
          ),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Border all button'),
          onPressed: () => showSnackBar(_ctx, 'Border Button click'),
          padding: EdgeInsets.all(20),
          elevation: 2,
          shape: Border.all(width: 2.0, color: Colors.redAccent),
        ),
        SizedBox(height: 10),
        MaterialButton(
          child: Text('Circle'),
          onPressed: () => showSnackBar(_ctx, 'Circle button click'),
          padding: EdgeInsets.all(30),
          elevation: 2,
          textColor: Colors.blue,
          shape: CircleBorder(
              side: BorderSide(
                  color: Colors.blue, width: 2.0, style: BorderStyle.solid)),
        ),
      ],
    );
  }

  List<Widget> _buildFloatingButtons() {
    return <Widget>[
      FloatingActionButton(
        heroTag: "Testcopy",
        child: Icon(Icons.content_copy),
        // tooltip: 'Copy code link to clipboard',
        onPressed: () async {
          await Clipboard.setData(
              ClipboardData(text: 'https://www.github.com/webaddicted/'));
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Code link copied to Clipboard!'),
          ));
        },
      ),
      FloatingActionButton(
        heroTag: "Testopen",
        child: Icon(Icons.open_in_new),
        // tooltip: 'View code on github',
        onPressed: () {},
      ),
      FloatingActionButton(
        heroTag: "Testzoom_out",
        child: Icon(Icons.zoom_out),
        // tooltip: 'Zoom out',
        onPressed: () => setState(() {
          // this._textScaleFactor = max(0.8, this._textScaleFactor - 0.1);
        }),
      ),
      FloatingActionButton(
        heroTag: "Testzoom_in",
        child: Icon(Icons.zoom_in),
        // tooltip: 'Zoom in',
        onPressed: () => setState(() {
          // this._textScaleFactor += 0.1;
        }),
      ),
    ];
  }

  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  Widget buildTextWithIcon() {
    return ProgressButton.icon(iconedButtons: {
      ButtonState.idle: IconedButton(
          text: "Send",
          icon: Icon(Icons.send, color: Colors.white),
          color: Colors.deepPurple.shade500),
      ButtonState.loading:
          IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
      ButtonState.fail: IconedButton(
          text: "Failed",
          icon: Icon(Icons.cancel, color: Colors.white),
          color: Colors.red.shade300),
      ButtonState.success: IconedButton(
          text: "Success",
          icon: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          color: Colors.green.shade400)
    }, onPressed: onPressedIconWithText, state: stateTextWithIcon);
  }

  void onPressedIconWithText() {
    switch (stateTextWithIcon) {
      case ButtonState.idle:
        stateTextWithIcon = ButtonState.loading;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            stateTextWithIcon = Random.secure().nextBool()
                ? ButtonState.success
                : ButtonState.fail;
          });
        });
        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        stateTextWithIcon = ButtonState.idle;
        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }
}
