import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BottomSheetScreen extends StatefulWidget {
  @override
  _BottomSheetScreenState createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  final _scafoldKey = GlobalKey<ScaffoldState>();
  VoidCallback _persistBottomSheetCallback;
  BuildContext _ctx;

  @override
  void initState() {
    super.initState();
    _persistBottomSheetCallback = _showBottomSheet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: getAppBar(context, StringConst.BOTTOM_SHEET_TITLE),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: getTxt('Persistent', FontWeight.bold),
                color: ColorConst.APP_COLOR,
                textColor: ColorConst.WHITE_COLOR,
                onPressed: _persistBottomSheetCallback),
            RaisedButton(
                child: getTxt('Model', FontWeight.bold),
                color: ColorConst.APP_COLOR,
                textColor: ColorConst.WHITE_COLOR,
                onPressed: () {
                  _showModalSheet();
                }),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet() {
    setState(() {
      _persistBottomSheetCallback = null;
    });
    _scafoldKey.currentState
        .showBottomSheet((context) {
          return _bottomSheetContainer();
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _persistBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return _bottomSheetContainer();
        });
  }

  Widget _bottomSheetContainer() {
    return Container(
      height: 300,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              getTxtBlackColor('Order Details', 22, FontWeight.bold),
              getTxtBlackColor('Rs- 465.0', 20, FontWeight.bold),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          getTxtGreyColor('Chicken Fried Rice 1*1', 15, FontWeight.normal),
          SizedBox(
            height: 5,
          ),
          getTxtGreyColor('Paneer Tikka *2', 15, FontWeight.normal),
          SizedBox(
            height: 10,
          ),
          getTxtBlackColor('Delivery Address', 18, FontWeight.bold),
          SizedBox(
            height: 5,
          ),
          getTxtGreyColor(
              'Room No-408, Lala G ka PG,\nNear chagan halwai hotel,\nBehind Pappu papad wala\nNoida Uttar Pradesh',
              18,
              FontWeight.normal),
          SizedBox(
            height: 5,
          ),
         dummyRaisedBtn('PROCESS PAYMENT', Colors.black),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
