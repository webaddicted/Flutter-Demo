import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/db/sqflite_user_table.dart';
import 'package:flutterbeginner/model/sqflite_login_user.dart';

class SqfliteSignup extends StatefulWidget {
  @override
  _SqfliteSignupState createState() => _SqfliteSignupState();
}

class _SqfliteSignupState extends State<SqfliteSignup> {
  BuildContext ctx;
  bool isLoading = false;
  var formKey = GlobalKey<FormState>();
  String _fullName = '',
      _emailId = '',
      _mobileNo = '',
      _dob = '',
      _password = '';
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 60),
                    Container(
                        width: 120, height: 120, child: loadImg("context", 0)),
                    SizedBox(height: 10),
                    getTxtAppColor(StringConst.APP_NAME, 25, FontWeight.bold),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
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
                      textInputAction: TextInputAction.next,
                      maxLength: 32,
                      validator: ValidationHelper.validateName,
                      onSaved: (String val) => _fullName = val,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
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
                      textInputAction: TextInputAction.next,
                      maxLength: 32,
                      validator: ValidationHelper.validateEmail,
                      onSaved: (String val) => _emailId = val,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
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
                      textInputAction: TextInputAction.next,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      validator: ValidationHelper.validateMobile,
                      onSaved: (String val) => _mobileNo = val,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
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
                      textInputAction: TextInputAction.next,
                      maxLength: 32,
                      readOnly: true,
                      controller: TextEditingController(text: _dob),
                      validator: (dob) =>
                          ValidationHelper.empty(dob, 'DOB is Required'),
                      onSaved: (String val) => _dob = val,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
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
                      obscureText: !passwordVisible,
                      textInputAction: TextInputAction.done,
                      maxLength: 32,
                      validator: ValidationHelper.validatePassword,
                      onSaved: (String val) => _password = val,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              child: Text('Login'),
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
            MaterialButton(
              child: getTxtColor(
                  'Login', ColorConst.APP_COLOR, 15, FontWeight.bold),
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.all(20),
              elevation: 2,
              shape: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: ColorConst.APP_COLOR, width: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _dobClick() async {
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
        _insert();
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
      Navigator.pop(context);
    } else
      showSnackBar(ctx, 'User already exist with $_emailId email id.');
    isLoading = false;
  }
}
