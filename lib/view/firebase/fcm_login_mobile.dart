import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/countries_bean.dart';
import 'package:flutterbeginner/view/firebase/fcm_otp_verify.dart';
import 'package:flutterbeginner/view/firebase/fcm_signup.dart';

class FcmLoginMobile extends StatefulWidget {
  @override
  _FcmLoginMobileState createState() => _FcmLoginMobileState();
}

class _FcmLoginMobileState extends State<FcmLoginMobile> {
  final formKey = GlobalKey<FormState>();
  final _dbRef = Firestore.instance;
  static final _fcmAuth = FirebaseAuth.instance;
  TextEditingController mobileNoCont = TextEditingController();
  TextEditingController otpCont = TextEditingController();
  BuildContext _ctx;
  List<CountryBean> _countryBean;
  static String verifId;

  @override
  void initState() {
    super.initState();
    _loadCountriesJson();
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  getTxtGreyColor('Create Account', 25, FontWeight.bold),
                  SizedBox(height: 20,),
                  SizedBox(
                      height: 225,
                      width: 150,
                      child: Image.asset(AssetsConst.MOBILE_IMG)),
                  SizedBox(height: 20),
                  getTxtBlackCenterColor('Enter your mobile number \nto create account',
                         20, FontWeight.normal),
                  SizedBox(height: 30),
                  getTxtGreyCenterColor('We will send you one time \npassword (OTP)',
                      18, FontWeight.normal),
                  SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        edtMobileNoField(mobileNoCont),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _loginBtn(),
                  SizedBox(height: 30),
                  Center(child: getTxtGreyColor('Dont have an account', 16, FontWeight.normal)),
                  SizedBox(height: 5),
                  GestureDetector(
                      onTap: ()=>navigationPush(context, FcmSignup()),
                      child: getTxtColor('SIGN UP',ColorConst.FCM_APP_COLOR, 16, FontWeight.bold)),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
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
    navigationPush(context, FcmOtpVerify());
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      setState(() {
//        isLoading = true;
        checkUser();
      });
    }
  }

  Future<List<CountryBean>> _loadCountriesJson() async {
    _countryBean.clear();
    var value = await DefaultAssetBundle.of(context)
        .loadString(AssetsConst.COUNTRY_PHONE_CODES_JSON);
    var countriesJson = json.decode(value);
    for (var country in countriesJson) {
      _countryBean.add(CountryBean.fromJson(country));
    }
    setState(() {});
    return _countryBean;
  }

  void checkUser() {
    _fcmAuth
        .verifyPhoneNumber(
            phoneNumber: '+91' + mobileNoCont.text,
            timeout: Duration(seconds: 60),
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
        .then((value) {
      print('Code sent');
    }).catchError((error) {
      print(error.toString());
    });
  }

  PhoneCodeSent codeSent =
      (String verificationId, [int forceResendingToken]) async {
    verifId = verificationId;
    print("\nEnter the code sent to ");
  };

  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
      (String verificationId) {
    verifId = verificationId;
    print("\nAuto retrieval time out");
  };

  final PhoneVerificationFailed verificationFailed =
      (AuthException authException) {
    print('${authException.message}');
    if (authException.message.contains('not authorized'))
      print('App not authroized');
    else if (authException.message.contains('Network'))
      print('Please check your internet connection and try again');
    else
      print('Something has gone wrong, please try later ' +
          authException.message);
  };

  PhoneVerificationCompleted verificationCompleted = (AuthCredential auth) {
    _fcmAuth.signInWithCredential(auth).then((AuthResult value) {
      if (value.user != null) {
        print('Authentication successful');
      } else {
        print('Invalid code/invalid authentication');
      }
    }).catchError((error) {
      print('Something has gone wrong, please try later $error');
    });
  };

  void _signInWithPhoneNumber() async {
    var _authCredential = await PhoneAuthProvider.getCredential(
        verificationId: verifId, smsCode: otpCont.text);
    _fcmAuth.signInWithCredential(_authCredential).then((value) async {
      showSnackBar(_ctx, 'Success   :  ' + value.toString());
    }).catchError((error) {
      showSnackBar(_ctx, 'Something has gone wrong, please try later');
    });
  }
}
