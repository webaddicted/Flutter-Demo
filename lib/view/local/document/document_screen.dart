import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_doc_bean.dart';
import 'package:flutterbeginner/view/local/document/document_folder.dart';
import 'package:permission_handler/permission_handler.dart';

class DocumentScreen extends StatefulWidget {
  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  late BuildContext _ctx;
  List<DeviceDocBean> listData = [];

  @override
  void initState() {
    super.initState();
    _reqPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx: context, title:StringConst.DOCUMENTS_TITLE),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            _reqPermission();
          }),
      body: Builder(builder: (context) => _createUi(context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    if (listData == null || listData.isEmpty) return showPbIndicator();
    return Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            return getDocRow(listData[index], index);
          },
        ));
  }

  Widget getDocRow(DeviceDocBean docBean, int index) {
    return InkWell(
      onTap: (){
        navigationPush(context, DocumentFolder(docBean));
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              loadCircleIcon(
                  Icons.picture_as_pdf, Colors.white, ColorConst.appColor, 30),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    getTxtBlackColor(msg:'${docBean.folderName!} [${docBean.files!.length}]', fontSize:16, fontWeight:FontWeight.bold),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _reqPermission() {
    List<Permission>permission = [Permission.storage];
    checkPermission(permission: permission, permissionResponse: (List<Permission>permissionDenied){
      if(permissionDenied==null || permissionDenied.isEmpty){
        getAllDoc(true);
      }else{
        printLog(msg: "${permissionDenied[0]} permission is Denied. ${permissionDenied.length}");
      }
    });
  }
  void getAllDoc(bool isPermissionGranted) async {
    if (!isPermissionGranted) return;
    if (listData != null) listData.clear();
    var docPath = await StoragePath.filePath;
    var response = jsonDecode(docPath!);
    var docList = response as List;
    listData = docList
        .map<DeviceDocBean>((json) => DeviceDocBean.fromJson(json))
        .toList();
    showSnackBar(_ctx, 'Documents count are  : ${listData.length}');
    printLog(msg: 'asdad  $listData');
    setState(() {});
  }
}
