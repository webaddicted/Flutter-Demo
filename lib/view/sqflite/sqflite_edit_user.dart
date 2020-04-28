import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/db/sqflite_user_table.dart';
import 'package:flutterbeginner/model/sqflite_login_user.dart';

class SqfliteEditUser extends StatefulWidget {
  SqfliteLoginUserBean _userBean;

  SqfliteEditUser.data(this._userBean);

  @override
  _SqfliteEditUserState createState() => _SqfliteEditUserState(_userBean);
}

class _SqfliteEditUserState extends State<SqfliteEditUser> {
  BuildContext ctx;
  bool isLoading = false;
  var formKey = GlobalKey<FormState>();
  String _fullName = '',
      _emailId = '',
      _mobileNo = '',
      _dob = '',
      _password = '';
  bool passwordVisible = false;
  SqfliteLoginUserBean _userBean;

  _SqfliteEditUserState(this._userBean);

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    passwordVisible = false;
    if (_userBean != null) {
      _fullName = _userBean.name;
      _emailId = _userBean.emailId;
      _mobileNo = _userBean.mobileNo;
      _dob = _userBean.dob;
      _password = _userBean.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(context, _userBean==null?'Cretate User':'Update User'),
        body: Builder(
      builder: (context) => _crateUi(context),
    ));
  }

  Widget _crateUi(BuildContext context) {
    ctx = context;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Container(
                    width: 100, height: 100, child: loadImg("context", 0)),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: TextEditingController(text: _fullName),
                      textInputAction: TextInputAction.next,
                      maxLength: 32,
                      validator: ValidationHelper.validateName,
                      onSaved: (String val) => _fullName = val,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        border: OutlineInputBorder(
                            gapPadding: 30,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: TextEditingController(text: _emailId),
                      textInputAction: TextInputAction.next,
                      maxLength: 32,
                      validator: ValidationHelper.validateEmail,
                      onSaved: (String val) => _emailId = val,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        border: OutlineInputBorder(
                            gapPadding: 30,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Email id",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: TextEditingController(text: _mobileNo),
                      textInputAction: TextInputAction.next,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      validator: ValidationHelper.validateMobile,
                      onSaved: (String val) => _mobileNo = val,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        border: OutlineInputBorder(
                            gapPadding: 30,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Mobile number",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      maxLength: 32,
                      readOnly: true,
                      controller: TextEditingController(text: _dob),
                      validator: (dob) =>
                          ValidationHelper.empty(dob, 'DOB is Required'),
                      onSaved: (String val) => _dob = val,
                      onTap: () => _dobClick(),
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        border: OutlineInputBorder(
                            gapPadding: 30,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "DOB",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: TextEditingController(text: _password),
                      obscureText: !passwordVisible,
                      textInputAction: TextInputAction.done,
                      maxLength: 32,
                      validator: ValidationHelper.validatePassword,
                      onSaved: (String val) => _password = val,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        border: OutlineInputBorder(
                            gapPadding: 30,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              child: Text(_userBean==null?'Submit':"Update"),
              onPressed: () {
                _submit();
              },
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
              color: ColorConst.APP_COLOR,
              textColor: ColorConst.WHITE_COLOR,
              shape: StadiumBorder(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _dobClick() async {
    formKey.currentState.save();
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));
    setState(() {
      _dob = '${date.year} - ${date.month} - ${date.day}';
    });
  }

  void _submit() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      setState(() {
        isLoading = true;
        if(_userBean==null)
        _insert();
        else _update();
      });
    }
  }

  void _insert() async {
    final userList = await SqfliteUserInfo.checkUserExist(_emailId);
    if (userList == null) {
      var loginBean =
          SqfliteLoginUserBean(_fullName, _emailId, _mobileNo, _dob, _password);
      final id = await SqfliteUserInfo.insertUser(loginBean);
      print('inserted row id: $id');
      isLoading = false;
//      showAlertDialog(ctx,'Congratulation', 'Account successfully created.');
      Navigator.pop(context, true);
    } else
      showSnackBar(ctx, 'User already exist with $_emailId email id.');
    isLoading = false;
  }

  void _update() async{
    final userList = await SqfliteUserInfo.checkUserExist(_emailId);
    if (userList != null) {
      var loginBean =
      SqfliteLoginUserBean(_fullName, _emailId, _mobileNo, _dob, _password);
        final id = await SqfliteUserInfo.updateUser(loginBean);
      print('update row id: $id');
      isLoading = false;
//      showAlertDialog(ctx,'Congratulation', 'Account successfully created.');
      Navigator.pop(context, true);
    } else
      showSnackBar(ctx, 'User not exist with $_emailId email id.\n so we can not update user.');
    isLoading = false;
  }
}
