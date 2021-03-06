import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/localfile/device_doc_bean.dart';
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
      appBar: getAppBarWithBackBtn(ctx:context, title:docBean.folderName.toString()),
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
                    child: getTxtWhiteColor(
                        msg:filesBean.mimeType.toUpperCase(),textAlign:TextAlign.center,fontSize: 11, fontWeight:FontWeight.bold)),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      getTxtBlackColor(msg:filesBean.title, fontSize:16, fontWeight:FontWeight.bold),
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
            getTxtAppColor(msg:docBean.title,fontSize: 18, fontWeight:FontWeight.bold),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            SizedBox(height: 10),
            getTxt(msg:'Doc Path : ${docBean.path}'),
            SizedBox(height: 10),
            getTxt(msg:'Doc Type : ${docBean.mimeType}'),
            SizedBox(height: 10),
            getTxt(msg:'Size : ${docBean.size}'),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
    showCustomDialog(ctx: context, dialogUi:dialogDetails);
  }
}
