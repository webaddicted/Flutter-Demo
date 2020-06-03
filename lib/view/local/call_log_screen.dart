import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:permission_handler/permission_handler.dart';

class CallLogScreen extends StatefulWidget {
  @override
  _CallLogScreenState createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  BuildContext _ctx;
  var listData = List<CallLogEntry>();

  @override
  void initState() {
    super.initState();
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.CALL_HISTORY_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            _reqPermission();
          }),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.length == 0) return showPbIndicator(true);
    return new Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return _callRow(listData[index], index);
          },
        ));
  }

  Widget _callRow(CallLogEntry callBean, int index) {
    String callIcon;
    switch (callBean.callType) {
      case CallType.incoming:
        callIcon = AssetsConst.CALL_RECEIVED_IMG;
        break;
      case CallType.missed:
        callIcon = AssetsConst.CALL_MISSED_IMG;
        break;
      case CallType.outgoing:
        callIcon = AssetsConst.CALL_DIAL_IMG;
        break;
      case CallType.rejected:
        callIcon = AssetsConst.CALL_CANCELLED_IMG;
        break;
      default:
        callIcon = AssetsConst.CALL_MISSED_IMG;
        break;
    }
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              SizedBox(height: 50, width: 50, child: Image.asset(callIcon)),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getTxtBlackColor(
                      (callBean.name != null && callBean.name.length > 0)
                          ? callBean.name
                          : callBean.number,
                      15,
                      FontWeight.bold),
                  SizedBox(height: 2),
                  getTxtBlackColor(callBean.number, 14, FontWeight.normal),
                  SizedBox(height: 2),
                  getTxtBlackColor('Duration  :  ${callBean.duration}', 14,
                      FontWeight.normal),
                  SizedBox(height: 2),
                  Align(
                    alignment: Alignment.centerRight,
                    child: getTxtBlackColor(
                        DateTime.fromMillisecondsSinceEpoch(callBean.timestamp)
                            .toString(),
                        14,
                        FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          getDivider()
        ],
      ),
    );
  }

  void _reqPermission() {
    var _storagePermission = PermissionGroup.phone;
    var permissionArray = [_storagePermission];
    checkPermission(_ctx, permissionArray, getCallLog);
  }

  void getCallLog(bool isPermissionGrented) async {
    if (!isPermissionGrented) return;
    if (listData != null) listData.clear();
    var result = await CallLog.query();
    result.forEach((entry) {
      print('object \n\n  ' + entry.toString());
      listData.add(entry);
    });
    setState(() {});
  }
}
