import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/bezierContainer.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/sqflite/sqflite_signup.dart';

class LoginPage2 extends StatefulWidget {
  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  bool isLoading = false;
  late GlobalKey<FormState> formKey;
  bool passwordVisible = false;
  late BuildContext ctx;
  late TextEditingController emailCont, pwdCont;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    emailCont = TextEditingController();
    pwdCont = TextEditingController();
    formKey = GlobalKey<FormState>();
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
        child: Container(
//          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -MediaQuery.of(context).size.height * .24,
                  left: -MediaQuery.of(context).size.width * .24,
                  child: BezierContainer()),
              Column(
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
                           loadCircleImg(ApiConstant.DEMO_IMG,0, 120),
                          SizedBox(height: 10),
                          getTxtAppColor(
                              msg: StringConst.APP_NAME,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
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
                          edtEmailIdField(emailCont),
                          SizedBox(height: 20),
                          edtPwdField(pwdCont, passwordVisible, pwdVisClick),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  raisedRoundAppColorBtn('Login', _submit),
                  SizedBox(height: 50),
                  MaterialButton(
                    child: getTxtColor(
                        msg: 'Signup',
                        txtColor: ColorConst.APP_COLOR,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
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
            ],
          ),
        ),
      ),
    );
  }

  pwdVisClick() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void _submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        isLoading = true;
        _checkUser();
      });
    }
  }

  void _checkUser() async {
    // print(userList.toString());
    // if (userList != null) {
    //   isLoading = false;
    navigationPush(ctx, LoginPage2());
    //   } else
    //     showSnackBar(ctx,
    //         'User not exist with ${emailCont.text} emailId.\nPlease signup with same emailId.');
    //   isLoading = false;
  }
}
