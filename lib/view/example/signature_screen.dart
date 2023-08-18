import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/global/customview/signature.dart';

class SignatureScreen extends StatefulWidget {
  @override
  _SignatureScreenState createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  late BuildContext _ctx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.SIGNATURE_TITLE),
      body: Builder(builder: (_context) => _createUi(_context)),
    );

  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Stack(
      children: <Widget>[

        Container(
          child: Signature(),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                heroTag: "btn1",
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                    ),
//                    mini: true,
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      setState(() {});
                    }),
                SizedBox(height: 15,),
                FloatingActionButton(
                heroTag: "btn2",
                    child: Icon(
                      Icons.save_alt,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      setState(() {});
                    })
              ],),
          ),
        ),
      ],

    );
  }
}
