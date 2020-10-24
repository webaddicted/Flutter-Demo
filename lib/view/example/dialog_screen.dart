import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';

class DialogScreen extends StatefulWidget {
  @override
  _DialogScreenState createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  BuildContext _ctx;

  List<CountryBean> _countryBean;

  @override
  void initState() {
    super.initState();
    _getCountry();
  }

  void _getCountry() async {
    _countryBean = await loadCountriesJson(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBarWithBackBtn(ctx: context, title: StringConst.DIALOG_TITLE),
      body: Builder(builder: (_context) {
        return _createUi(_context);
      }),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            raisedBtn('Normal Dialog', normalDialog),
            SizedBox(height: 10),
            raisedBtn('Single Btn Dialog', singleClickDialog),
            SizedBox(height: 10),
            raisedBtn('Two Btn Dialog', twoClickDialog),
            SizedBox(height: 10),
            raisedBtn('Custom Dialog', customDialog),
            SizedBox(height: 10),
            raisedBtn('Full Screen Dialog', fullSceenDialog),
            SizedBox(height: 10),
            raisedBtn('List Dialog', listDialog),
          ],
        ),
      ),
    );
  }

  normalDialog() {
    showAlertDialog(
        ctx: context, title: StringConst.APP_NAME, msg: StringConst.DUMMY_TEXT);
  }

  singleClickDialog() {
    showSingleClickDialog(
        ctx: context,
        title: StringConst.APP_NAME,
        msg: StringConst.DUMMY_TEXT,
        okClick: okClick);
  }

  okClick() {
    Navigator.pop(context);
  }

  twoClickDialog() {
    showTwoClickDialog(
        ctx: context,
        title: StringConst.APP_NAME,
        msg: StringConst.DUMMY_TEXT,
        okClick: okClick,
        cancelClick: okClick);
  }

  customDialog() {
    var dialogDetails = Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getTxtBlackColor(
                  msg: StringConst.APP_NAME,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              getTxt(msg: StringConst.DUMMY_TEXT),
              SizedBox(height: 10),
              SizedBox(
                width: 320.0,
                child: RaisedButton(
                  onPressed: okClick,
                  child: getTxtWhiteColor(
                      msg: 'Save', fontSize: 15, fontWeight: FontWeight.bold),
                  color: const Color(0xFF1BC0C5),
                ),
              )
            ],
          ),
        ),
      ),
    );
    showCustomDialog(ctx: context, dialogUi: dialogDetails);
  }

  fullSceenDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height - 120,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  )
                ],
              ),
            ),
          );
        });
  }

  listDialog() {
    showDialog(
        context: context,
        child: new AlertDialog(
            title: getTxtBlackColor(
                msg: StringConst.APP_NAME, fontWeight: FontWeight.bold),
            content: Container(
              child: ListView.builder(
//              shrinkWrap: true,
                itemCount: _countryBean.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                        '${_countryBean[index].flag}  (${_countryBean[index].dialCode})  ${_countryBean[index].name} '),
                    onTap: () {
                      Navigator.pop(_ctx);
                      showSnackBar(_ctx,
                          '${_countryBean[index].flag}  (${_countryBean[index].dialCode})  ${_countryBean[index].name} ');
                    },
                  );
                },
              ),
            )));
  }

  imagePickerDialog() {
    showDialog(
        context: context,
        child: new AlertDialog(
            title: getTxtBlackColor(
                msg: StringConst.APP_NAME, fontWeight: FontWeight.bold),
            content: Container(
                child: Column(
              children: <Widget>[
                getTxtBlackColor(msg: 'Capture Image', fontSize: 15),
                Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                getTxtBlackColor(msg: 'Gallery Image', fontSize: 15),
              ],
            ))));
  }
}
