import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_doc_bean.dart';
import 'package:storage_path/storage_path.dart';

class DocumentScreen extends StatefulWidget {
  @override
  _DocumentScreenState createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  BuildContext _ctx;
  var listData = List<DeviceDocBean>();

  @override
  void initState() {
    super.initState();
    getAllDoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, StringConst.DOCUMENTS_TITLE),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            getAllDoc();
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
            return getDocRow();
          },
        ));
  }

  Widget getDocRow() {
    return Container();
  }

  void getAllDoc() async {
    if (listData != null) listData.clear();
    String docPath = await StoragePath.filePath;
    var response = jsonDecode(docPath);
    var docList = response as List;
    listData = docList
        .map<DeviceDocBean>((json) => DeviceDocBean.fromJson(json))
        .toList();
    showSnackBar(_ctx, 'Documents count are  : ${listData.length}');
    print('asdad  ' + listData.toString());
    setState(() {});
  }
}
