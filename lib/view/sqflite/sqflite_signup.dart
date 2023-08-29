import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/dialog_utility.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class SqfliteSignup extends StatefulWidget {
  @override
  State<SqfliteSignup> createState() => _SqfliteSignupState();
}

class _SqfliteSignupState extends State<SqfliteSignup> {
  late BuildContext ctx;
  bool isLoading = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController mobileNoCont = TextEditingController();
  TextEditingController dobCont = TextEditingController();
  TextEditingController pwdCont = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
      builder: (context) => _crateUi(context),
    ));
  }

  Widget _crateUi(BuildContext context) {
    ctx = context;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 60),
                  SizedBox(
                      width: 120, height: 120, child: loadCircleImg(ApiConstant.DEMO_IMG,0, 0)),
                  const SizedBox(height: 10),
                  getTxtAppColor(msg:StringConst.APP_NAME, fontSize:25, fontWeight:FontWeight.bold),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  edtNameField(fullNameCont),
                  const SizedBox(height: 10),
                  edtMobileNoField(mobileNoCont),
                  const SizedBox(height: 10),
                  edtEmailIdField(emailCont),
                  const SizedBox(height: 10),
                  edtDobField(dobCont, _dobClick),
                  const SizedBox(height: 10),
                  edtPwdField(pwdCont, passwordVisible, pwdVisClick),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          raisedRoundAppColorBtn('Signup', _submit),
          const SizedBox(height: 30),
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            padding: const EdgeInsets.all(20),
            elevation: 2,
            shape: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorConst.appColor, width: 3),
            ),
            child: getTxtColor(
                msg:'Login', txtColor:ColorConst.appColor, fontSize:15, fontWeight:FontWeight.bold),
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

  void _dobClick() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));
    setState(() {
      dobCont.text = '${date?.year} - ${date?.month} - ${date?.day}';
    });
  }

  void _submit() {
    final form = formKey.currentState;
    if (formKey.currentState!.validate()) {
      form?.save();
      setState(() {
        isLoading = true;
        _insert();
      });
    }
  }

  void _insert() async {
      showSingleClickDialog(
          ctx:context, title:'Congratulations', msg:'User successfully created', okClick:okClick);
  }

  okClick() {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
