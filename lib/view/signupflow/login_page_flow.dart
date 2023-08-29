import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/home/home_page1.dart';
import 'package:flutterbeginner/view/signupflow/signup_page_flow.dart';

class LoginPageFlow extends StatefulWidget {
  const LoginPageFlow({super.key});

  @override
  State<LoginPageFlow> createState() => _LoginPageFlowState();
}

class _LoginPageFlowState extends State<LoginPageFlow> {
  late TextEditingController mobileController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    mobileController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.appColorFlow1,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 90),
              SizedBox(width: 200, child: Image.asset(AssetsConst.logoImg)),
              Form(
                  key: formKey,
                  child: Theme(
                      data: ThemeData(
                          primaryColor: ColorConst.whiteColor,
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: ColorConst.whiteColor, fontSize: 15)),
                          colorScheme: ColorScheme.fromSwatch()
                              .copyWith(secondary: ColorConst.whiteColor)),
                      child: Container(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: <Widget>[
                            edtMobileNoField(mobileController, textColor: ColorConst.whiteColor),
                            const Padding(padding: EdgeInsets.only(top: 20)),
                            edtPwdField(passwordController, passwordVisible,
                                pwdVisClick, textColor: ColorConst.whiteColor),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            MaterialButton(
                                padding: const EdgeInsets.only(
                                    left: 50, right: 50, top: 12, bottom: 12),
                                shape: const StadiumBorder(
                                    side: BorderSide(
                                        color: Colors.transparent, width: 1)),
                                color: ColorConst.whiteColor,
                                onPressed: () => submit(),
                                textColor: ColorConst.whiteColor,
                                splashColor: ColorConst.whiteColor,
                                child: getTxtAppColor(
                                    msg: "Login",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            InkWell(
                                onTap: () =>
                                    navigationPush(context, const SignupPageFlow()),
                                child: getTxtWhiteColor(
                                    msg: "Don't have an account yet?  Sign Up",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      )))
            ],
          ),
        ));
  }
  pwdVisClick() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
  void submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      navigationPush(context, HomePage1());
    }
  }
  @override
  void dispose() {
    super.dispose();
    mobileController.dispose();
    passwordController.dispose();
  }
}
