import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';
import 'package:flutterbeginner/view/firebase/fcm_otp_verify.dart';
import 'package:flutterbeginner/view/firebase/fcm_signup.dart';
import 'package:flutterbeginner/view/widgets/country_dialog.dart';

class FcmLoginMobile extends StatefulWidget {
  @override
  _FcmLoginMobileState createState() => _FcmLoginMobileState();
}

class _FcmLoginMobileState extends State<FcmLoginMobile> {
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNoCont = TextEditingController();
  TextEditingController otpCont = TextEditingController();
  static BuildContext? _ctx;
  late List<CountryBean> _countryBean;

  var _countryCode = '🇮🇳 (+91) ';

  String _dialCode = '+91';

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
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  getTxtGreyColor(
                      msg: 'Create Account',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 155,
                      width: 130,
                      child: Image.asset(AssetsConst.MOBILE_IMG)),
                  const SizedBox(height: 20),
                  getTxtBlackColor(
                      msg: 'Enter your mobile number \nto create account',
                      textAlign: TextAlign.center,
                      fontSize: 20),
                  const SizedBox(height: 30),
                  getTxtGreyColor(
                      msg: 'We will send you one time \npassword (OTP)',
                      textAlign: TextAlign.center,
                      fontSize: 18),
                  const SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3.0,
                              offset: Offset(1.0, 1.0))
                        ],
                      ),
                      child: TextFormField(
                        controller: mobileNoCont,
                        textInputAction: TextInputAction.next,
                        // maxLines: 1,
                        // maxLength: 10,
                        keyboardType: TextInputType.number,
                        // validator: ValidationHelper.validateMobile(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // fillColor: Colors.transparent,
                          hintText: 'Phone Number',
                          contentPadding: const EdgeInsets.only(top: 15),
                          prefixIcon: InkWell(
                              onTap: () => showDialog(
                                  context: context,
                                builder:(_) =>  CountryDialog(
                                    countries: _countryBean,
                                    onCellTap: countryCodeTap,
                                  )),
                              child: SizedBox(
                                width: 100,
                                child: Center(
                                  child: getTxtBlackColor(
                                      msg: _countryCode, fontSize: 17),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _loginBtn(),
                  const SizedBox(height: 30),
                  Center(
                      child: getTxtGreyColor(
                          msg: 'Dont have an account', fontSize: 16)),
                  const SizedBox(height: 5),
                  GestureDetector(
                      onTap: () => navigationPush(context, FcmSignup()),
                      child: getTxtColor(
                          msg: 'SIGN UP',
                          txtColor: ColorConst.FCM_APP_COLOR,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
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
      child: MaterialButton(
          shape: const StadiumBorder(),
          color: ColorConst.FCM_APP_COLOR,
          child: getTxtWhiteColor(
              msg: 'Login', fontSize: 15, fontWeight: FontWeight.bold),
          onPressed: () => _submitLogin()),
    );
  }

  _submitLogin() {
//    navigationPush(context, FcmOtpVerify());
    final form = formKey.currentState;
    if (formKey.currentState!.validate()) {
      form!.save();
      setState(() {
//        isLoading = true;
        otpSentSuccess();
      });
    }
  }

  Future<List<CountryBean>> _loadCountriesJson() async {
    _countryBean = [];
    var value = await DefaultAssetBundle.of(context)
        .loadString(AssetsConst.COUNTRY_PHONE_CODES_JSON);
    var countriesJson = json.decode(value);
    for (var country in countriesJson) {
      _countryBean.add(CountryBean.fromJson(country));
    }
    printLog(msg: "object" + _countryBean.toString());
    setState(() {});
    return _countryBean;
  }

  static otpSentSuccess() {
    Navigator.pop(_ctx!);
    navigationPush(_ctx!, FcmOtpVerify());
  }

  countryCodeTap(CountryBean p1) {
    printLog(msg: "code   :${p1.flag}  $p1");
    _dialCode = p1.dialCode!;
    _countryCode = '${p1.flag} (${p1.dialCode}) ';
    setState(() {});
  }
}
