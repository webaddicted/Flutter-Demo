import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class SignupPageFlow extends StatefulWidget {
  const SignupPageFlow({super.key});

  @override
  State<SignupPageFlow> createState() => _SignupPageFlowState();
}

class _SignupPageFlowState extends State<SignupPageFlow>
    with SingleTickerProviderStateMixin {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
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
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white))),
              ),
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
                            edtNameField(nameController, textColor: ColorConst.whiteColor),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            edtMobileNoField(mobileController, textColor: ColorConst.whiteColor),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            edtEmailIdField(emailController, textColor: ColorConst.whiteColor),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            edtPwdField(passwordController, passwordVisible, pwdVisClick, textColor: ColorConst.whiteColor),
                            const Padding(padding: EdgeInsets.only(top: 20)),
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
                                    msg: "SignUp",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))
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
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
