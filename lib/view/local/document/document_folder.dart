import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/localfile/device_doc_bean.dart';
import 'package:open_file/open_file.dart';

class DocumentFolder extends StatefulWidget {
  DeviceDocBean docBean;
  DocumentFolder(this.docBean);

  @override
  _DocumentFolderState createState() => _DocumentFolderState(docBean);
}

class _DocumentFolderState extends State<DocumentFolder> {
  BuildContext _ctx;
  DeviceDocBean docBean;
  _DocumentFolderState(this.docBean);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, docBean.folderName.toString()),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: docBean.files.length,
          itemBuilder: (BuildContext context, int index) {
            return getDocRow(docBean.files[index], index);
          },
        ));
  }

  Widget getDocRow(DocFiles filesBean, int index) {
    return InkWell(
      onTap: (){
        OpenFile.open(filesBean.path);
      },
      onLongPress: (){docDetails(filesBean);},
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Container(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: ColorConst.APP_COLOR,
                    radius: 35.0,
                    child: getTxtWhiteCenterColor(
                        filesBean.mimeType.toUpperCase(), 11, FontWeight.bold)),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      getTxtBlackColor(filesBean.title, 16, FontWeight.bold),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void docDetails(DocFiles docBean) {
    var dialogDetails = Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            getTxtAppColor(docBean.title, 18, FontWeight.bold),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            SizedBox(height: 10),
            getTxt('Doc Path : ${docBean.path}', null),
            SizedBox(height: 10),
            getTxt('Doc Type : ${docBean.mimeType}', null),
            SizedBox(height: 10),
            getTxt('Size : ${docBean.size}', null),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
    showCustomDialog(context, dialogDetails);
  }
}
