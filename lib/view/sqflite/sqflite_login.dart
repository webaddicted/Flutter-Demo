import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/db/sqflite_user_table.dart';
import 'package:flutterbeginner/view/sqflite/sqflite_signup.dart';
import 'package:flutterbeginner/view/sqflite/sqlite_home.dart';

class SqfliteLogin extends StatefulWidget {
  @override
  _SqfliteLoginState createState() => _SqfliteLoginState();
}

class _SqfliteLoginState extends State<SqfliteLogin> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  String _emailId = '', _password = '';
  bool passwordVisible = false;

  BuildContext ctx;
  TextEditingController  emailCont = TextEditingController();
  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => _crateUi(context),)
    );
  }

  Widget _crateUi(BuildContext context) {
ctx= context;
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
                    SizedBox(height: 90),
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
                    emailIdField(_emailId, emailCont),
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
            SizedBox(height: 50),
            MaterialButton(
              child: getTxtColor(
                  'Signup', ColorConst.APP_COLOR, 15, FontWeight.bold),
              onPressed: () {
                navigationPush(context, SqfliteSignup());
              },
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

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        isLoading = true;
        _checkUser();
      });
    }
  }

  void _checkUser() async {
    final userList = await SqfliteUserInfo.checkUserExist(emailCont.text);
    print(userList.toString());
    if (userList != null) {
      isLoading = false;
      navigationPush(ctx, SqliteHome());
    }
    else
      showSnackBar(ctx,
          'User not exist with ${emailCont.text} emailId.\nPlease signup with same emailId.');
    isLoading = false;
  }
}
