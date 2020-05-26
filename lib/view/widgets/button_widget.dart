import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.BUTTON_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        padding: EdgeInsets.all(5.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                _getButtonType(),
              ],
            ),
          ),
        ));
  }
  Widget _getButtonType() {
    return Column(
      children: <Widget>[
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
}
