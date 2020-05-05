import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/sqflite_login_user.dart';
import 'package:flutterbeginner/view/firebase/fcm_signup.dart';
import 'package:pinput/pin_put/pin_put.dart';

class FcmOtpVerify extends StatefulWidget {
  @override
  _FcmOtpVerifyState createState() => _FcmOtpVerifyState();
}

class _FcmOtpVerifyState extends State<FcmOtpVerify> {
  final formKey = GlobalKey<FormState>();
  BuildContext _ctx;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: ColorConst.FCM_APP_COLOR),
      borderRadius: BorderRadius.circular(5),
    );
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
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  getTxtGreyColor('Verify Account', 25, FontWeight.bold),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 150, child: Image.asset(AssetsConst.OTP_IMG)),
                  SizedBox(height: 20),
                  getTxtBlackColor(
                      'Verification Code',
                      20,
                      FontWeight.bold),
                  SizedBox(height: 20),
                  getTxtGreyCenterColor(
                      'OTP has been sent to your mobile\nnumber please verify',
                      18,
                      FontWeight.normal),
                  Form(
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
                      child: PinPut(
                        fieldsCount: 6,
                       validator: ValidationHelper.validateOtp,
                        onSubmit: (String pin) => showSnackBar(_ctx, pin),
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5)),
                        selectedFieldDecoration: _pinPutDecoration,
                        followingFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: ColorConst.FCM_APP_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () => navigationPush(context, FcmSignup()),
                      child: getTxtColor('Resend OTP',
                          ColorConst.FCM_APP_COLOR, 18, FontWeight.bold)),
                  SizedBox(height: 20),
                  _verifyBtn(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _verifyBtn() {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 45,
      child: RaisedButton(
          shape: StadiumBorder(),
          color: ColorConst.FCM_APP_COLOR,
          child: getTxtWhiteColor('Verify', 15, FontWeight.bold),
          onPressed: () => _submitVerify()),
    );
  }

  _submitVerify() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      setState(() {
//        isLoading = true;
//        checkUser();
      });
    }
  }

}
