import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';
import 'package:flutterbeginner/view/firebase/fcm_home.dart';
import 'package:flutterbeginner/view/firebase/fcm_otp_verify.dart';
import 'package:flutterbeginner/view/firebase/fcm_signup.dart';

class FcmLoginMobile extends StatefulWidget {
  @override
  _FcmLoginMobileState createState() => _FcmLoginMobileState();
}

class _FcmLoginMobileState extends State<FcmLoginMobile> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNoCont = TextEditingController();
  TextEditingController otpCont = TextEditingController();
  static BuildContext _ctx;
  List<CountryBean> _countryBean;

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
                  getTxtGreyColor(msg:'Create Account', fontSize:25, fontWeight:FontWeight.bold),
                  SizedBox(height: 20,),
                  SizedBox(
                      height: 225,
                      width: 150,
                      child: Image.asset(AssetsConst.MOBILE_IMG)),
                  SizedBox(height: 20),
                  getTxtBlackColor(msg:'Enter your mobile number \nto create account',
                      textAlign:TextAlign.center,
                         fontSize: 20),
                  SizedBox(height: 30),
                  getTxtGreyColor(msg:'We will send you one time \npassword (OTP)',
                      textAlign:TextAlign.center,
                     fontSize: 18),
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
                  Center(child: getTxtGreyColor(msg:'Dont have an account', fontSize:16)),
                  SizedBox(height: 5),
                  GestureDetector(
                      onTap: ()=>navigationPush(context, FcmSignup()),
                      child: getTxtColor(msg:'SIGN UP',txtColor:ColorConst.FCM_APP_COLOR, fontSize:16, fontWeight:FontWeight.bold)),
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
          child: getTxtWhiteColor(msg:'Login', fontSize:15, fontWeight:FontWeight.bold),
          onPressed: () => _submitLogin()),
    );
  }

  _submitLogin() {
//    navigationPush(context, FcmOtpVerify());
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      setState(() {
//        isLoading = true;
        otpSentSuccess();
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






  static otpSentSuccess() {
    Navigator.pop(_ctx);
    navigationPush(_ctx, FcmOtpVerify());
  }
}
