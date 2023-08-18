import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:sms/sms.dart';

class SmsScreen extends StatefulWidget {
  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  late BuildContext _ctx;
  // SmsQuery query;
  var listData =[];

  @override
  void initState() {
    super.initState();
    // query = new SmsQuery();
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.SMS_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _reqPermission();
          },
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.isEmpty) return showPbIndicator();
    return Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(child: getTxtAppColor(msg: "${listData[index]}"));
              // smsRow(listData[index]);
          },
        ));
  }

  // Widget smsRow(SmsMessage listData) {
  //   return Card(
  //     elevation: 2,
  //     color: Colors.white,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: new Container(
  //         child: Row(
  //           children: <Widget>[
  //             listData.isRead
  //                 ? loadCircleIcon(
  //                     Icons.markunread, Colors.white, Colors.grey, 30)
  //                 : loadCircleIcon(
  //                     Icons.markunread, Colors.white, ColorConst.APP_COLOR, 30),
  //             SizedBox(width: 15),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   getTxtBlackColor(msg:listData.address,fontSize: 16, fontWeight:FontWeight.bold),
  //                   getTxtGreyColor(msg:listData.body, fontSize:15),
  //                   Align(
  //                     alignment: Alignment.centerRight,
  //                     child: new Text(
  //                       listData.date.toLocal().toString(),
  //                       style: new TextStyle(color: ColorConst.GREY_COLOR),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _reqPermission() {
    List<Permission>permission = [Permission.sms];
    checkPermission(permission: permission, permissionResponse: (List<Permission>permissionDenied){
      if(permissionDenied==null || permissionDenied.isEmpty){
        getSms(true);
      }else{
        printLog(msg: "${permissionDenied[0]} permission is Denied. ${permissionDenied.length}");
      }
    });
  }

  void getSms(bool isPermissionGranted) async {
    if (!isPermissionGranted) return;
    if (listData != null) listData.clear();
//    inbox & sent sms
    listData =[];// await query.getAllSms;
    showSnackBar(_ctx, 'SMS count are  : ${listData.length}');
//    inbox sms
//    var inboxData = await query.querySms();
//    print('inboxData   :  ' + inboxData.map.toString());
//    all conversion
//    var listDataThread = await query.getAllThreads;
//    Contact contact = listDataThread.first.contact;
    setState(() {});
  }
}
