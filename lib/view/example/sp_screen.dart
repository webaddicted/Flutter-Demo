import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/sp/sp_manager.dart';

class SPScreen extends StatefulWidget {
  @override
  _SPScreenState createState() => _SPScreenState();
}

class _SPScreenState extends State<SPScreen> {
  BuildContext _ctx;

  var _nameCont = TextEditingController();

  String _showNameTxt = '',
      _showAllKeysTxt = '',
      _removeKeyTxt = '',
      _clearPrefTxt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(context, StringConst.SP_TITLE),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
              RaisedButton(
                  child: getTxt('Save Name', null),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _setPrefValue();
                  }),
              SizedBox(width: 10),
              getTxt(_showNameTxt, FontWeight.bold),
              SizedBox(width: 10),
              RaisedButton(
                  child: getTxt('Get Name', null),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _getPrefValue();
                  }),
              SizedBox(width: 10),
              getTxt(_showAllKeysTxt, FontWeight.bold),
              SizedBox(width: 10),
              RaisedButton(
                  child: getTxt('Get All Keys', null),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _getAllKeys();
                  }),
              SizedBox(width: 10),
              getTxt(_removeKeyTxt, FontWeight.bold),
              SizedBox(width: 10),
              RaisedButton(
                  child: getTxt('Remove Name', null),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _removeKeys();
                  }),
              SizedBox(width: 10),
              getTxt(_clearPrefTxt, FontWeight.bold),
              SizedBox(width: 10),
              RaisedButton(
                  child: getTxt('Clear Preference', null),
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
