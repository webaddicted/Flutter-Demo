import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:permission_handler/permission_handler.dart';

class CallLogScreen extends StatefulWidget {
  @override
  State<CallLogScreen> createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen>  with SingleTickerProviderStateMixin {
  List<CallLogEntry> listData = [];
  late TabController _tabController;
  List<CallLogEntry> receivedCallListData = [];
  List<CallLogEntry> missedCallListData = [];
  List<CallLogEntry> dialCallListData = [];
  List<CallLogEntry> cancelledCallListData = [];
  var isLoading = true;
  List<Permission>permissionDeniedList = [];
  @override
  void initState() {
    super.initState();
    _reqPermission();
   _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: StringConst.CALL_HISTORY_TITLE,
      tabBar: _getTab()),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            _reqPermission();
          }),
      body: Builder(builder: (_context) => _createUi()),
    );
  }

  TabBar _getTab() {
    return TabBar(
      controller: _tabController,
      labelColor: ColorConst.appColor,
      indicatorColor: ColorConst.appColor,
      indicatorWeight: 3.0,
      tabs: const <Widget>[
        Tab(icon: Icon(Icons.dialer_sip,color: ColorConst.appColor,),text: "Dialed call"),
        Tab(icon: Icon(Icons.call_received,color: ColorConst.appColor),text: "Received call"),
        Tab(icon: Icon(Icons.call_missed,color: ColorConst.appColor),text: "Missed call"),
        Tab(icon: Icon(Icons.cancel_schedule_send_outlined,color: ColorConst.appColor,),text: "Reject call"),

      ],
    );
  }
  Widget _createUi() {
    if (listData == null || listData.isEmpty) return showPbIndicator();
    for(int i=0;i<listData.length;i++){
      callDifferentType(listData[i], i);
    }
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        callLogList(dialCallListData),
        callLogList(receivedCallListData),
        callLogList(missedCallListData),
        callLogList(cancelledCallListData),
      ],
    );
  }
  Widget callLogList(List<CallLogEntry> callListData) {
    if(permissionDeniedList.isNotEmpty){
      return GetErrorWidget(
          errorMessage: "Permission Denied ${permissionDeniedList[0]}",
          onRetryPressed: () {
            _reqPermission();
          });
    }else if(isLoading){
      return GetLoadingWidget();
    }

    return Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: callListData.length,
          itemBuilder: (BuildContext context, int index) {
            return _callRow(callListData[index], index);
          },
        ));
  }
  callDifferentType(CallLogEntry callBean, int index) {
    switch (callBean.callType) {
      case CallType.incoming:
        receivedCallListData.add(callBean);
        break;
      case CallType.missed:
        missedCallListData.add(callBean);
        break;
      case CallType.outgoing:
        dialCallListData.add(callBean);
        break;
      case CallType.rejected:
        cancelledCallListData.add(callBean);
        break;
      default:
        missedCallListData.add(callBean);
        break;
    }
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _callRow(CallLogEntry callBean, int index) {
    String callIcon;
    switch (callBean.callType) {
      case CallType.incoming:
        callIcon = AssetsConst.callReceivedImg;
        break;
      case CallType.missed:
        callIcon = AssetsConst.callMissedImg;
        break;
      case CallType.outgoing:
        callIcon = AssetsConst.callDialImg;
        break;
      case CallType.rejected:
        callIcon = AssetsConst.callCancelledImg;
        break;
      default:
        callIcon = AssetsConst.callMissedImg;
        break;
    }
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(width: 10),
              SizedBox(height: 50, width: 50, child: Image.asset(callIcon)),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getTxtBlackColor(
                      msg: (callBean.name! != null && callBean.name!.isNotEmpty)
                          ? callBean.name!
                          : callBean.number!,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 2),
                  getTxt(msg: callBean.number!),
                  const SizedBox(height: 2),
                  getTxt(msg: 'Duration  :  ${callBean.duration}'),
                  const SizedBox(height: 2),
                  Align(
                    alignment: Alignment.centerRight,
                    child: getTxt(
                      msg: DateTime.fromMillisecondsSinceEpoch(
                              callBean.timestamp!)
                          .toString(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          getDivider()
        ],
      ),
    );
  }

  void _reqPermission() {
    List<Permission>permission = [Permission.phone];
    checkPermission(permission: permission, permissionResponse: (List<Permission>permissionDenied){
      if(permissionDenied==null || permissionDenied.isEmpty){
        getCallLog(true);
      }else{
      permissionDeniedList = permissionDenied;
        setState(() {});
        printLog(msg: "${permissionDenied[0]} permission is Denied. ${permissionDenied.length}");
      }
    });
  }

  void getCallLog(bool isPermissionGranted) async {
    if (!isPermissionGranted) return;
    isLoading = true;
    if (listData != null) listData.clear();
    var result = await CallLog.query();
    for (var entry in result) {
      listData.add(entry);
    }
    isLoading = false;
    setState(() {});
  }
}

