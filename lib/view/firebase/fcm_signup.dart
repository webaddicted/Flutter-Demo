import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/sqflite_login_user.dart';
import 'package:flutterbeginner/view/firebase/fcm_login.dart';
import 'package:path/path.dart' as Path;

class FcmSignup extends StatefulWidget {
  @override
  _FcmSignupState createState() => _FcmSignupState();
}

class _FcmSignupState extends State<FcmSignup> {
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  BuildContext _ctx;
  bool isLoading = false;
  final _dbRef = Firestore.instance;
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController mobileNoCont = TextEditingController();
  TextEditingController dobCont = TextEditingController();
  TextEditingController pwdCont = TextEditingController();
  File imageURI;

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
                  Stack(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: getSignupImagePicker(
                              130, imageURI, imagePickerDialog),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: getTxtColor('Create new \naccount',
                        ColorConst.FCM_APP_COLOR, 25, FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        edtNameField(fullNameCont),
                        SizedBox(height: 10),
                        edtMobileNoField(mobileNoCont),
                        SizedBox(height: 10),
                        edtEmailIdField(emailCont),
                        SizedBox(height: 10),
                        edtDobField(dobCont, dobClick),
                        SizedBox(height: 10),
                        edtPwdField(pwdCont, passwordVisible, pwdVisClick),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  _signupBtn(),
                  SizedBox(height: 30),
                  Center(
                      child: getTxtGreyColor(
                          'Already have an account', 16, FontWeight.normal)),
                  SizedBox(height: 5),
                  Center(
                      child: GestureDetector(
                          onTap: () => navigationPush(context, FcmLogin()),
                          child: getTxtColor('LOGIN', ColorConst.FCM_APP_COLOR,
                              16, FontWeight.bold))),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dobClick() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));
    setState(() {
      dobCont.text = '${date.year} - ${date.month} - ${date.day}';
    });
  }

  pwdVisClick() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  Widget _signupBtn() {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 45,
      child: RaisedButton(
          shape: StadiumBorder(),
          color: ColorConst.FCM_APP_COLOR,
          child: getTxtWhiteColor('Signup', 15, FontWeight.bold),
          onPressed: () => _submitSignup()), //_submitSignup()),
    );
  }
  imagePickerDialog() {
    imagePickDialog(context, selectedfile);
  }

  selectedfile(File imgFile) {
    setState(() {
      imageURI = imgFile;
    });
  }

  void _submitSignup() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
      setState(() {
        isLoading = true;
        checkUser();
      });
    }
  }

  void checkUser() async {
    var loginBean = SqfliteLoginUserBean(
        fullNameCont.text, emailCont.text, mobileNoCont.text, dobCont.text, pwdCont.text);
    final snapShot = await _dbRef
        .collection(ApiConst.FIRESTORE_COLL_USERS)
        .document(loginBean.mobileNo)
        .get();
    if (snapShot.exists) {
      showSnackBar(_ctx, 'User already exist with this mobile number');
    } else {
      await _dbRef
          .collection(ApiConst.FIRESTORE_COLL_USERS)
          .document(loginBean.mobileNo)
          .setData(loginBean.toMap())
          .then((result) => {
                if (imageURI != null) {uploadFile()},
                showSnackBar(_ctx, 'Successfully Signup')
              })
          .catchError((err) {
        showSnackBar(_ctx, err);
        print(err);
      });
    }
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(imageURI.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(imageURI);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        print('File Uploaded $fileURL');
        showSnackBar(_ctx, 'File Uploaded $fileURL');
      });
    });
  }


}
