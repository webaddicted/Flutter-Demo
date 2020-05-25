import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:sms/contact.dart';
import 'package:sms/sms.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SmsScreen extends StatefulWidget {
  @override
  _SmsScreenState createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  BuildContext _ctx;
  SmsQuery query;
  var listData = List<SmsMessage>();

  @override
  void initState() {
    super.initState();
    query = new SmsQuery();
    getSms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.SMS_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.youtube_searched_for),
          onPressed: () {
            getSms();
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
            return smsRow(listData[index]);
          },
        ));
  }

  void getSms() async {
    if (listData != null) listData.clear();
//    inbox & sent sms
    listData = await query.getAllSms;
//    inbox sms
    var inboxData = await query.querySms();
    print('inboxData   :  ' + inboxData.map.toString());
//    all conversion
    var listDataThread = await query.getAllThreads;
    Contact contact = listDataThread.first.contact;
    print('listDataThread.first.contact   :  ' + contact.toString());
    print('Sms Message : ' +
        listData.length.toString() +
        "  sdsdsd   : " +
        listData.toString());
    setState(() {});
  }

  Widget smsRow(SmsMessage listData) {
    print('Contacts   :  ' + listData.toMap.toString());
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
          child: Row(
            children: <Widget>[
              listData.isRead
                  ? loadCircleIcon(
                      Icons.markunread, Colors.white, Colors.grey, 30)
                  : loadCircleIcon(
                      Icons.markunread, Colors.white, ColorConst.APP_COLOR, 30),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    getTxtBlackColor(listData.address, 16, FontWeight.bold),
                    getTxtGreyColor(listData.body, 15, null),
                    Align(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        listData.date.toLocal().toString(),
                        style: new TextStyle(color: ColorConst.GREY_COLOR),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
