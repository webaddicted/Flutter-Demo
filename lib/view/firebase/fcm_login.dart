import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/sqflite_login_user.dart';
import 'package:flutterbeginner/view/firebase/fcm_signup.dart';

class FcmLogin extends StatefulWidget {
  @override
  _FcmLoginState createState() => _FcmLoginState();
}

class _FcmLoginState extends State<FcmLogin> {
  final formKey = GlobalKey<FormState>();
  String _mobileNo = '',
      _password = '';
  bool passwordVisible = false;
  final _dbRef = Firestore.instance;
  TextEditingController mobileNoCont = TextEditingController();
  BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      child: Stack(
        children: <Widget>[
          bgDesign(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: getTxtColor('Log in to your \naccount',
                        ColorConst.FCM_APP_COLOR, 25, FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        edtMobileNoField(_mobileNo, mobileNoCont),
                        SizedBox(height: 10),
                        _pwd(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerRight,
                      child: getTxtColor('Forgot Password ? ',ColorConst.FCM_APP_COLOR, 16, FontWeight.bold)),
                  SizedBox(height: 20),
                  _loginBtn(),
                  SizedBox(height: 20),
                  Center(child: getTxtGreyColor('Dont have an account', 16, FontWeight.normal)),
                  SizedBox(height: 5),
                  Center(child: GestureDetector(
                      onTap: ()=>navigationPush(context, FcmSignup()),
                      child: getTxtColor('SIGN UP',ColorConst.FCM_APP_COLOR, 16, FontWeight.bold))),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pwd() {
    return TextFormField(
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        border: OutlineInputBorder(
            gapPadding: 30, borderRadius: BorderRadius.circular(30)),
        hintText: "Password",
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible ? Icons.visibility : Icons.visibility_off,
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
    );
  }

  Widget _loginBtn() {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 45,
      child: RaisedButton(
          shape: StadiumBorder(),
          color: ColorConst.FCM_APP_COLOR,
          child: getTxtWhiteColor('Login', 15, FontWeight.bold),
          onPressed: () => _submitLogin()),
    );
  }

  _submitLogin() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      setState(() {
//        isLoading = true;
        checkUser();
      });
    }
  }

  void checkUser() async {
    final snapShot = await _dbRef
        .collection(ApiConst.FIRESTORE_COLL_USERS)
        .document(mobileNoCont.text)
        .get();
    if (snapShot.exists) {
      await _dbRef
          .collection(ApiConst.FIRESTORE_COLL_USERS)
          .document(mobileNoCont.text)
          .get()
          .then((result) {
        var loginInfo = SqfliteLoginUserBean.map(snapShot.data);
        if (loginInfo.password == _password) {
          showSnackBar(_ctx, '${loginInfo.mobileNo} Successfully login');
        } else {
          showSnackBar(_ctx, 'Incorrect password please use correct password.');
        }
      }).catchError((err) {
        showSnackBar(_ctx, err);
        print(err);
      });
    } else {
      showSnackBar(_ctx, 'User already exist with this mobile number');
    }
  }
}
