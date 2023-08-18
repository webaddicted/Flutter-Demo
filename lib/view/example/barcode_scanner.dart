// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  late BuildContext _ctx;

  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(ctx: context, title: StringConst.BAR_CODE_TITLE),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return new Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          getTxt(msg: result, fontWeight: FontWeight.bold),
          SizedBox(height: 15),
          raisedBtn('Scan Barcode', openScanner),
          SizedBox(height: 15),
          raisedBtn('Scan QR', scanQR),
        ],
      ),
    );
  }

  openScanner() async {
    var _aspectTolerance = 0.00;
    var _numberOfCameras = 0;
    var _selectedCamera = -1;
    var _useAutoFocus = true;
    var _autoEnableFlash = false;
    //TODO UNDO
    // try {
//       var options = ScanOptions(
//         useCamera: _selectedCamera,
//         autoEnableFlash: _autoEnableFlash,
//         android: AndroidOptions(
//           aspectTolerance: _aspectTolerance,
//           useAutoFocus: _useAutoFocus,
//         ),
//       );
//
//       var scanresult = await BarcodeScanner.scan(options: options);
//
// //      var scanresult = await BarcodeScanner.scan();
//       print(scanresult.type); // The result type (barcode, cancelled, failed)
//       print(scanresult.rawContent); // The barcode content
//       print(scanresult.format); // The barcode format (as enum)
//       print(scanresult
//           .formatNote); // If a unknown format was scanned this field contains a note
//       result = 'Type : ${scanresult.type}\n'
//           'Format : ${scanresult.format}\n'
//           'Format Note : ${scanresult.formatNote}\n'
//           'Content : ${scanresult.rawContent}\n';
//       setState(() {});
//     } catch (e) {
//       print('barcode error : ' + e.toString());
//     }
  }

  Future<void> scanQR() async {
    String barcodeScanRes = "";
    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//          "#ff6666", "Cancel", true, ScanMode.QR);
//      print(barcodeScanRes);
//    } on PlatformException {
//      barcodeScanRes = 'Failed to get platform version.';
//      print("object");
//    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      result = barcodeScanRes;
    });
  }
}
