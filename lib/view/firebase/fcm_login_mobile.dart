import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/countries_bean.dart';
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
                      height: 155,
                      width: 130,
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
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(30.0),
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3.0,
                              offset: new Offset(1.0, 1.0))
                        ],
                      ),

                      child: TextFormField(
                        controller: mobileNoCont,
                        textInputAction: TextInputAction.next,
                        // maxLines: 1,
                        // maxLength: 10,
                        keyboardType: TextInputType.number,
                        validator: ValidationHelper.validateMobile,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // fillColor: Colors.transparent,
                          hintText: 'Phone Number',
                          contentPadding: EdgeInsets.only(top: 15),
                          prefixIcon: InkWell(
                              onTap: () => showDialog(
                                  context: context,
                                  child: _CountryCodeDialog(
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
    _countryBean = new List();
    var value = await DefaultAssetBundle.of(context)
        .loadString(AssetsConst.COUNTRY_PHONE_CODES_JSON);
    var countriesJson = json.decode(value);
    for (var country in countriesJson) {
      _countryBean.add(CountryBean.fromJson(country));
    }
    print("object" + _countryBean.toString());
    setState(() {});
    return _countryBean;
  }

  static otpSentSuccess() {
    Navigator.pop(_ctx);
    navigationPush(_ctx, FcmOtpVerify());
  }

  countryCodeTap(CountryBean p1) {
    print("code   :${p1.flag}  $p1");
    _dialCode = p1.dialCode;
    _countryCode = '${p1.flag} (${p1.dialCode}) ';
    setState(() {});
  }
}
class _CountryCodeDialog extends StatefulWidget {
  final List<CountryBean> countries;
  final Function(CountryBean) onCellTap;

  const _CountryCodeDialog({@required this.countries, this.onCellTap});

  @override
  _CountryCodeDialogState createState() => _CountryCodeDialogState();
}

class _CountryCodeDialogState extends State<_CountryCodeDialog> {
  List<CountryBean> _countries;
  TextEditingController _controller;
  Size _size;

  @override
  void initState() {
    _countries = widget.countries;
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      contentPadding: EdgeInsets.zero,
      title: Theme(
        child: TextField(
          controller: _controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            prefixStyle: TextStyle(color: Colors.black, fontSize: 35),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black87),
            ),
          ),
          onChanged: (str) {
            _countries = widget.countries
                .where((e) => (e.name.toUpperCase().contains(str.toUpperCase()))||e.dialCode.toUpperCase().contains(str.toUpperCase()))
                .toList();
            setState(() {});
          },
        ),
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black87,
        ),
      ),
      children: <Widget>[
        Container(
          height: _size.height-10,
          width: _size.width-20,
          child: ListView.separated(
            padding: EdgeInsets.all(15),
            separatorBuilder: (_, __) => Divider(
              height: 25,
            ),
            itemCount: _countries.length,
            itemBuilder: (_, index) {
              final d = _countries[index];
              return _CountryCell(
                data: d,
                onTap: widget.onCellTap,
              );
            },
          ),
        )
      ],
    );
  }
}

class _CountryCell extends StatelessWidget {
  final CountryBean data;
  final Function(CountryBean) onTap;

  _CountryCell({this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(data.name),
      onTap: () {
        onTap(data);
        Navigator.of(context).pop();
      },
      child: Container(
        child: Row(
          children: <Widget>[
            getTxtBlackColor(msg:data.flag, fontSize: 22),
            SizedBox(width: 10),
            getTxtBlackColor(msg:' (${data.dialCode}) ', fontSize: 16),
            Expanded(child: getTxtBlackColor(msg:data.name, fontSize: 16, maxLines: 1)),

          ],
        ),
      ),

    );
  }
}