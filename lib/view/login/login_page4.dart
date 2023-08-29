import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/sqflite/sqflite_signup.dart';
import 'package:flutterbeginner/view/sqflite/sqlite_home.dart';

class LoginPage4 extends StatefulWidget {
  @override
  _LoginPage4State createState() => _LoginPage4State();
}

class _LoginPage4State extends State<LoginPage4> {
  bool isLoading = false;
  late GlobalKey<FormState> formKey;
  bool passwordVisible = false;
  late BuildContext ctx;
  late TextEditingController emailCont, pwdCont;
  final Color color1 = Colors.purple;
  final Color color2 =Colors.purpleAccent;
  final Color color3 =Colors.purpleAccent;
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
    ctx = context;
    return Scaffold(
        body: Builder(
      builder: (context) => _crateUi(context),
    ));
  }

  Widget _crateUi(BuildContext context) {
    // ctx = context;
    return Container(
      child: Stack(
        children: [
          _buildHeader(),
          SingleChildScrollView(
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
                        SizedBox(height: 130),
                        loadCircleImg(ApiConstant.DEMO_IMG, 0, 120),
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
                      txtColor: ColorConst.appColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  onPressed: () {
                    navigationPush(context, SqfliteSignup());
                  },
                  padding: EdgeInsets.all(20),
                  elevation: 2,
                  shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorConst.appColor, width: 3),
                  ),
                ),
              ],
            ),
          ),
        ],
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
    // final userList = await SqfliteUserInfo.checkUserExist(emailCont.text);
    // print(userList.toString());
    // if (userList != null) {
    //   isLoading = false;
    navigationPush(ctx, SqliteHome());
    // } else
    //   showSnackBar(ctx,
    //       'User not exist with ${emailCont.text} emailId.\nPlease signup with same emailId.');
    // isLoading = false;
  }
  Container _buildHeader() {
    return Container(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: -100,
            top: -150,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [color1, color2]
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: color2,
                        offset: Offset(4.0,4.0),
                        blurRadius: 10.0
                    )
                  ]
              ),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [color1, color2]
                ),
                boxShadow: [
                  BoxShadow(
                      color: color3,
                      offset: Offset(1.0,1.0),
                      blurRadius: 4.0
                  )
                ]
            ),
          ),
          Positioned(
            top: 100,
            right: 200,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [color3,color2]
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: color3,
                        offset: Offset(1.0,1.0),
                        blurRadius: 4.0
                    )
                  ]
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 60,
                left: 30
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(StringConst.WEBADDICTED, style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 10.0),
                Text("You have 2 remaining\ntasks for today!", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
