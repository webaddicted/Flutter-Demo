import 'dart:io';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:path_provider/path_provider.dart';

createApplicationFolder() async {
  try {
    final directory = await getExternalStorageDirectory();
    String appName = StringConst.APP_NAME;
    String download = StringConst.DOWNLOAD;
    final appFolderpath = Directory('${directory.path}/$appName');
    if (!(await appFolderpath.exists())) appFolderpath.create();
    final downloadPath = Directory('${appFolderpath.path}/$download');
    if (!(await downloadPath.exists())) downloadPath.create();
  } catch (exp) {
    print(exp);
  }
}

Future<File> getDownloadFile(String fileName) async {
  File fileUrl;
  try {
    final directory = await getExternalStorageDirectory();
    String appName = StringConst.APP_NAME;
    String download = StringConst.DOWNLOAD;
    final dir = Directory('${directory.path}/$appName/$download');
    fileUrl = File("${dir.path}/$fileName");
  } catch (exp) {
    print(exp);
  }
  return fileUrl;
}
String getFileName(String fileUrl){
  return fileUrl.split('/').last;
}
