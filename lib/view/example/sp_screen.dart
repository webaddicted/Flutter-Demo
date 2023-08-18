import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/sp/sp_manager.dart';

class SPScreen extends StatefulWidget {
  @override
  _SPScreenState createState() => _SPScreenState();
}

class _SPScreenState extends State<SPScreen> {
  late BuildContext _ctx;

  var _nameCont = TextEditingController();

  String _showNameTxt = '',
      _showAllKeysTxt = '',
      _removeKeyTxt = '',
      _clearPrefTxt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.SP_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                  controller: _nameCont,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Icon(
                      Icons.person_pin,
                      color: Colors.blueAccent,
                    ),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                  )),
              SizedBox(width: 10),
              MaterialButton(
                  child: getTxt(msg:'Save Name'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _setPrefValue();
                  }),
              SizedBox(width: 10),
              getTxt(msg:_showNameTxt, fontWeight:FontWeight.bold),
              SizedBox(width: 10),
              MaterialButton(
                  child: getTxt(msg:'Get Name'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _getPrefValue();
                  }),
              SizedBox(width: 10),
              getTxt(msg:_showAllKeysTxt, fontWeight:FontWeight.bold),
              SizedBox(width: 10),
              MaterialButton(
                  child: getTxt(msg:'Get All Keys'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _getAllKeys();
                  }),
              SizedBox(width: 10),
              getTxt(msg:_removeKeyTxt, fontWeight:FontWeight.bold),
              SizedBox(width: 10),
              MaterialButton(
                  child: getTxt(msg:'Remove Name'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _removeKeys();
                  }),
              SizedBox(width: 10),
              getTxt(msg:_clearPrefTxt, fontWeight:FontWeight.bold),
              SizedBox(width: 10),
              MaterialButton(
                  child: getTxt(msg:'Clear Preference'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _clearPref();
                  }),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _setPrefValue() {
    SPManager.setName(_nameCont.text.toString());
    showSnackBar(_ctx, 'User name save successfully.');
  }

  void _getPrefValue() async {
    var spValue = await SPManager.getName();
    _showNameTxt = 'Get user name : \n' + spValue.toString();
    setState(() {});
  }

  void _getAllKeys() async {
    var spValue = await SPManager.getAllKeys();
    _showAllKeysTxt = 'All Saved kays are : \n' + spValue.toString();
    setState(() {});
  }

  void _removeKeys() async {
    var spValue = await SPManager.removeKeys();
    _removeKeyTxt = 'Key remove successfully : \n' + spValue.toString();
    setState(() {});
  }

  void _clearPref() async {
    var spValue = await SPManager.clearPref();
    _clearPrefTxt = 'All keys remove successfully : \n' + spValue.toString();
    setState(() {});
  }
}
