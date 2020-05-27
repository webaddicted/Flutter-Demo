import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:sms/sms.dart';
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
          onPressed: () {
            getSms();
          },
          child: Icon(Icons.refresh, color: Colors.white),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
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

  void getSms() async {
    if (listData != null) listData.clear();
//    inbox & sent sms
    listData = await query.getAllSms;
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