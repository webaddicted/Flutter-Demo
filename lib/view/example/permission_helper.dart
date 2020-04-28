import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper extends StatefulWidget {
  @override
  _PermissionHelperState createState() => _PermissionHelperState();
}

class _PermissionHelperState extends State<PermissionHelper> {
  BuildContext _ctx;
  String _txtCheckPerResult = '';
  String _txtReqPerResult = '';
  var _storagePermission;
  PermissionHandler _permissionHandler;
  @override
  void initState() {
    super.initState();
    _storagePermission =
        Platform.isAndroid ? PermissionGroup.storage : PermissionGroup.photos;
    _permissionHandler = PermissionHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(context, StringConst.PERMISSION_HELPER_TITLE),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              getTxtBlackColor(_txtCheckPerResult, 15, FontWeight.bold),
              SizedBox(height: 10),
              RaisedButton(
                color: ColorConst.APP_COLOR,
                onPressed: () => _checkStoragePermission(),
                child: getTxtWhiteColor(
                    'Check Storage Permission', 15, FontWeight.normal),
              ),
              SizedBox(height: 10),
              getTxtBlackColor(_txtReqPerResult, 15, FontWeight.bold),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () => _reqStoragePermission(),
                color: ColorConst.APP_COLOR,
                child: getTxtWhiteColor(
                    'Request Storage Permission', 15, FontWeight.normal),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _checkStoragePermission() async {
    var permissionStatus =
        await _permissionHandler.checkPermissionStatus(_storagePermission);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        _txtCheckPerResult = 'Permission granted';
        break;
      case PermissionStatus.denied:
        _txtCheckPerResult = 'Permission denied';
        break;
      case PermissionStatus.disabled:
        _txtCheckPerResult = 'Permission disabled';
        break;
      case PermissionStatus.restricted:
        _txtCheckPerResult = 'Permission restricted';
        break;
      case PermissionStatus.unknown:
        _txtCheckPerResult = 'Permission unknown';
        break;
      default:
    }
    setState(() {});
  }

  void _reqStoragePermission() async {

    var result =
        await _permissionHandler.requestPermissions([_storagePermission]);
    switch (result[_storagePermission]) {
      case PermissionStatus.granted:
        _txtReqPerResult = 'Permission granted';
        break;
      case PermissionStatus.denied:
        _txtReqPerResult = 'Permission denied';
        break;
      case PermissionStatus.disabled:
        _txtReqPerResult = 'Permission disabled';
        break;
      case PermissionStatus.restricted:
        _txtReqPerResult = 'Permission restricted';
        break;
      case PermissionStatus.unknown:
        _txtReqPerResult = 'Permission unknown';
        break;
      default:
    }
    setState(() {});
  }
}
