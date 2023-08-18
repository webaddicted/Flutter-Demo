import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:permission_handler/permission_handler.dart';
// import 'package:image_picker/image_picker.dart';
Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

// HexColor("#D26661").withOpacity(0.1);
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    if (hexColor.isEmpty) hexColor = "323483";
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

int _getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor';
  }
  return int.parse(hexColor, radix: 16);
}

Future<List<CountryBean>> loadCountriesJson(BuildContext context) async {
  List<CountryBean> countryBean = [];
  var value = await DefaultAssetBundle.of(context)
      .loadString(AssetsConst.COUNTRY_PHONE_CODES_JSON);
  var countriesJson = jsonDecode(value);
  for (var country in countriesJson) {
    countryBean.add(CountryBean.fromJson(country));
  }
  return countryBean;
}

//{START IMAGE PICKER}
imagePickDialog(BuildContext context, Function selectedfile) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
          title: getTxtBlackColor(
              msg: 'Select Option', fontWeight: FontWeight.bold),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  getImageFromCamera(context, 0, selectedfile);
                },
                child: Container(
                    padding: const EdgeInsets.all(15),
                    child: getTxtBlackColor(msg: 'Take Photo')),
              ),
              const Divider(
                color: Colors.grey,
                height: 1,
              ),
              GestureDetector(
                  onTap: () {
                    getImageFromCamera(context, 1, selectedfile);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: getTxtBlackColor(msg: 'Choose From Gallery'))),
            ],
          )));
}

Future getImageFromCamera(
    BuildContext context, int imageType, Function selectedfile) async {
  Navigator.pop(context);
  //TODO UNDO
  // var image = await ImagePicker().getImage(
  //     source: imageType == 0 ? ImageSource.camera : ImageSource.gallery);
  // selectedfile(image);
}
//{END IMAGE PICKER}

int randomNumber() {
  Random random = Random();
  return random.nextInt(1000);
}

String formatTime(double time) {
  Duration duration = Duration(milliseconds: time.round());
  return [duration.inHours, duration.inMinutes, duration.inSeconds]
      .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
      .join(':');
}

String filesize(dynamic size, [int round = 2]) {
  int divider = 1024;
  int size0;
  try {
    size0 = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }

  if (size0 < divider) {
    return "$size0 B";
  }

  if (size0 < divider * divider && size0 % divider == 0) {
    return "${(size0 / divider).toStringAsFixed(0)} KB";
  }

  if (size0 < divider * divider) {
    return "${(size0 / divider).toStringAsFixed(round)} KB";
  }

  if (size0 < divider * divider * divider && size0 % divider == 0) {
    return "${(size0 / (divider * divider)).toStringAsFixed(0)} MB";
  }

  if (size0 < divider * divider * divider) {
    return "${(size0 / divider / divider).toStringAsFixed(round)} MB";
  }

  if (size0 < divider * divider * divider * divider && size0 % divider == 0) {
    return "${(size0 / (divider * divider * divider)).toStringAsFixed(0)} GB";
  }

  if (size0 < divider * divider * divider * divider) {
    return "${(size0 / divider / divider / divider).toStringAsFixed(round)} GB";
  }

  if (size0 < divider * divider * divider * divider * divider &&
      size0 % divider == 0) {
    num r = size0 / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} TB";
  }

  if (size0 < divider * divider * divider * divider * divider) {
    num r = size0 / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} TB";
  }

  if (size0 < divider * divider * divider * divider * divider * divider &&
      size0 % divider == 0) {
    num r = size0 / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} PB";
  } else {
    num r = size0 / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} PB";
  }
}

//Widget getVideoThumb(File videoFile){
//  var _controller = VideoPlayerController.file(videoFile)
//    ..initialize().then((_) {
////      setState(() {});
//    });
//  var videoPla =  VideoPlayer(_controller);
//_controller.dispose();
//  return videoPla;
//}
//TODO UNDO
// checkPermission(
//     BuildContext ctx, List<Permission> _storagePermission, Function permissionResult) async {
// //  var _permissionHandler = Permission;
//   _storagePermission.request();
//   // Map<Permission, PermissionStatus> statuses = await [
//   //   Permission.location,
//   //   Permission.storage,
//   // ].request();
//   print('Permission.location');
//   Map<Permission, PermissionStatus> result =
//       await _storagePermission.request();
//   bool isPermissionGranted = false;
//   result.forEach((key, values) {
//     if (values == PermissionStatus.granted)
//       isPermissionGranted = true;
//     else {
//       isPermissionGranted = false;
//       permissionResult(isPermissionGranted);
//       showSnackBar(ctx, 'Permission denied');
//       return;
//     }
//   });
//   permissionResult(isPermissionGranted);
// }
final logger = Logger();

printLog(
    {String tag = "",
    required dynamic msg,
    ApiStatus status = ApiStatus.success}) {
  if (kDebugMode) {
    print("$tag : $msg");
    if (status == ApiStatus.error) {
      logger.e("$tag : $msg");
    } else {
      logger.d("$tag : $msg");
    }
  }
}

checkPermission(
    {required List<Permission> permission,
    required Function permissionResponse}) async {
  var permissionStatus = await permission.request();
  List<Permission> permissionDenied = [];
  for (int i = 0; i < permissionStatus.length; i++) {
    if (permissionStatus[permission[i]] != PermissionStatus.granted) {
      permissionDenied.add(permission[i]);
    }
  }
  permissionResponse(permissionDenied);
}
