import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/firebase/fcm_home.dart';
import 'package:flutterbeginner/view/firebase/fcm_signup.dart';

class FcmOtpVerify extends StatefulWidget {

  FcmOtpVerify();

  @override
  _FcmOtpVerifyState createState() => _FcmOtpVerifyState();
}

class _FcmOtpVerifyState extends State<FcmOtpVerify> {
  final formKey = GlobalKey<FormState>();
  late BuildContext _ctx;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();


  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: ColorConst.fcmAppColor),
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
                  getTxtGreyColor(
                      msg: 'Verify Account',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 150, child: Image.asset(AssetsConst.otpImg)),
                  SizedBox(height: 20),
                  getTxtBlackColor(
                      msg: 'Verification Code',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  SizedBox(height: 20),
                  getTxtGreyColor(
                      msg:
                          'OTP has been sent to your mobile\nnumber please verify',
                      fontSize: 18,
                      textAlign:TextAlign.center,
                      fontWeight: FontWeight.normal),
                  // Form(
                  //   child: Container(
                  //     padding: EdgeInsets.only(
                  //         left: 20, right: 20, top: 40, bottom: 30),
                  //     child: PinPut(
                  //       fieldsCount: 6,
                  //       validator: ValidationHelper.validateOtp,
                  //       onSubmit: (String pin) => showSnackBar(_ctx, pin),
                  //       focusNode: _pinPutFocusNode,
                  //       controller: _pinPutController,
                  //       submittedFieldDecoration: _pinPutDecoration.copyWith(
                  //           borderRadius: BorderRadius.circular(5)),
                  //       selectedFieldDecoration: _pinPutDecoration,
                  //       followingFieldDecoration: _pinPutDecoration.copyWith(
                  //         borderRadius: BorderRadius.circular(5),
                  //         border: Border.all(
                  //           color: ColorConst.FCM_APP_COLOR,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                      onTap: () => navigationPush(context, FcmSignup()),
                      child: getTxtColor(
                          msg: 'Resend OTP',
                          txtColor: ColorConst.fcmAppColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
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
      child: MaterialButton(
          shape: StadiumBorder(),
          color: ColorConst.fcmAppColor,
          child: getTxtWhiteColor(
              msg: 'Verify', fontSize: 15, fontWeight: FontWeight.bold),
          onPressed: () => _submitVerify()),
    );
  }

  _submitVerify() {
//    final form = formKey.currentState;
//    if (formKey.currentState.validate()) {
//      form.save();
//      setState(() {
//      });
//    }
    if (_pinPutController.text.length == 6)
      _signInWithPhoneNumber();
    else
      showSnackBar(_ctx, 'Please enter all OTP code');
  }

  void _signInWithPhoneNumber() async {
      navigationPush(_ctx, FcmHome());
  }
}
