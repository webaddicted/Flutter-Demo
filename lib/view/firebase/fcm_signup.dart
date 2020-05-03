import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/sqflite_login_user.dart';
import 'package:flutterbeginner/view/firebase/fcm_login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
class FcmSignup extends StatefulWidget {
  @override
  _FcmSignupState createState() => _FcmSignupState();
}

class _FcmSignupState extends State<FcmSignup> {
  var formKey = GlobalKey<FormState>();
  String _fullName = '',
      _emailId = '',
      _mobileNo = '',
      _dob = '',
      _password = '';
  bool passwordVisible = false;
  BuildContext _ctx;
  bool isLoading = false;
  final _dbRef = Firestore.instance;
  TextEditingController mobileNoCont = TextEditingController();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();

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
                        child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 30),
                            height: 130,
                            width: 130,
                            child: Stack(
                              children: <Widget>[
                                getCircularImage(130, imageURI),
                                Container(
                                    alignment: Alignment.bottomRight,
                                    child:
                                        getCircularImageClick(45, imagePick)),
                              ],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: getTxtColor('Log in to your \naccount',
                        ColorConst.FCM_APP_COLOR, 25, FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        edtNameField(_fullName, fullNameCont),
                        SizedBox(height: 10),
                        edtMobileNoField(_mobileNo, mobileNoCont),
                        SizedBox(height: 10),
                        emailIdField(_emailId, emailCont),
                        SizedBox(height: 10),
                        _edtDobField(),
                        SizedBox(height: 10),
                        _pwd(),
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

  Widget _pwd() {
    return TextFormField(
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        border: OutlineInputBorder(
            gapPadding: 30, borderRadius: BorderRadius.circular(30)),
        hintText: "Password",
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ),
      ),
      obscureText: !passwordVisible,
      textInputAction: TextInputAction.done,
      maxLength: 32,
      validator: ValidationHelper.validatePassword,
      onSaved: (String val) => _password = val,
    );
  }

  Widget _edtDobField() {
    return TextFormField(
      onTap: () => _dobClick(),
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        border: OutlineInputBorder(
            gapPadding: 30, borderRadius: BorderRadius.circular(30)),
        hintText: "DOB",
        hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
      ),
      textInputAction: TextInputAction.next,
      maxLength: 32,
      readOnly: true,
      controller: TextEditingController(text: _dob),
      validator: (dob) => ValidationHelper.empty(dob, 'DOB is Required'),
      onSaved: (String val) => _dob = val,
    );
  }

  void _dobClick() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));
    setState(() {
      _dob = '${date.year} - ${date.month} - ${date.day}';
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
        fullNameCont.text, emailCont.text, mobileNoCont.text, _dob, _password);
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
            if(imageURI!=null){
              uploadFile()
            },
            showSnackBar(_ctx, 'Successfully Signup')})
          .catchError((err) {
        showSnackBar(_ctx, err);
        print(err);
      });
    }
  }
  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('chats/${Path.basename(imageURI.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(imageURI);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        showSnackBar(_ctx,'File Uploaded $fileURL');
      });
    });
  }

  imagePick() {
    showDialog(
        context: context,
        child: new AlertDialog(
            title:
                getTxtBlackColor(StringConst.APP_NAME, null, FontWeight.bold),
            content: Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    getImageFromCamera(0);
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: getTxtBlackColor('Capture Image', 15, null)),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                GestureDetector(
                    onTap: () {
                      getImageFromCamera(1);
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        child: getTxtBlackColor('Gallery Image', 15, null))),
              ],
            ))));
  }

  Future getImageFromCamera(int imageType) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: imageType == 0 ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      imageURI = image;
    });
  }
}
