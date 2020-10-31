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
  Permission _permissionHandler;

  @override
  void initState() {
    super.initState();
    _storagePermission =
        Platform.isAndroid ? Permission.storage : Permission.photos;
    _permissionHandler = Permission.storage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.PERMISSION_HELPER_TITLE),
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
              getTxtBlackColor(
                  msg: _txtCheckPerResult,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              RaisedButton(
                color: ColorConst.APP_COLOR,
                onPressed: () => _checkStoragePermission(),
                child: getTxtWhiteColor(
                    msg: 'Check Storage Permission', fontSize: 15),
              ),
              SizedBox(height: 10),
              getTxtBlackColor(
                  msg: _txtReqPerResult,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () => _reqStoragePermission(),
                color: ColorConst.APP_COLOR,
                child: getTxtWhiteColor(
                    msg: 'Request Storage Permission', fontSize: 15),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _checkStoragePermission() async {
    var permissionStatus = await _permissionHandler.status;
    switch (permissionStatus) {
      case PermissionStatus.granted:
        _txtCheckPerResult = 'Permission granted';
        break;
      case PermissionStatus.denied:
        _txtCheckPerResult = 'Permission denied';
        break;
      case PermissionStatus.undetermined:
        _txtCheckPerResult = 'Permission undetermined';
        break;
      case PermissionStatus.restricted:
        _txtCheckPerResult = 'Permission restricted';
        break;
      case PermissionStatus.permanentlyDenied:
        _txtCheckPerResult = 'Permission permanentlyDenied';
        break;
      default:
    }
    setState(() {});
  }

  void _reqStoragePermission() async {
    var result = await _permissionHandler.request;
    var status = await _permissionHandler.status;
    switch (status) {
      case PermissionStatus.granted:
        _txtReqPerResult = 'Permission granted';
        break;
      case PermissionStatus.denied:
        _txtReqPerResult = 'Permission denied';
        break;
      case PermissionStatus.undetermined:
        _txtReqPerResult = 'Permission undetermined';
        break;
      case PermissionStatus.restricted:
        _txtReqPerResult = 'Permission restricted';
        break;
      case PermissionStatus.permanentlyDenied:
        _txtReqPerResult = 'Permission permanentlyDenied';
        break;
      default:
    }
    setState(() {});
  }
}
