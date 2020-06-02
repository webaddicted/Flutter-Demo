import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';

//  {START PAGE NAVIGATION}
void navigationPush(BuildContext context, StatefulWidget route) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return route;
    },
  ));
}

void navigationPop(BuildContext context, StatefulWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPush(BuildContext context, StatelessWidget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPop(BuildContext context, StatelessWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void delay(BuildContext context, int duration, StatefulWidget route) {
  Future.delayed(const Duration(seconds: 3), () {
    navigationPush(context, route);
  });
}

//  {END PAGE NAVIGATION}
//  {START APPBAR}
AppBar getAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: new Text(
      title,
      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}

AppBar getAppBarWithBackBtn(BuildContext context, String title) {
  return AppBar(
    leading: new IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: ColorConst.WHITE_COLOR,
        ),
        onPressed: () {
          Navigator.pop(context);
        }),
    centerTitle: true,
    title: new Text(
      title,
      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}

AppBar getAppBarColorWithBackBtn(
    BuildContext context, String title, Color bgColor) {
  return AppBar(
    backgroundColor: bgColor,
    leading: new IconButton(
        icon: Icon(
          Icons.keyboard_backspace,
          color: ColorConst.WHITE_COLOR,
        ),
        onPressed: () {
          Navigator.pop(context);
        }),
    centerTitle: true,
    title: new Text(
      title,
      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}

//  {END APPBAR}
//  {START LOAD IMAGE}
FadeInImage loadImg(String url, int placeHolderPos) {
  return new FadeInImage.assetNetwork(
      fit: BoxFit.fill,
      placeholder: _getPlaceHolder(placeHolderPos),
      image: url);
}

ClipRRect loadLocalCircleImg(String imagePath, double radius) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: new FadeInImage.assetNetwork(
        height: radius,
        width: radius,
        fit: BoxFit.fill,
        placeholder: imagePath,
        image: 'imgUrl'),
  );
}

ClipRRect loadCircleImg(String imgUrl, int placeHolderPos, double radius) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: new FadeInImage.assetNetwork(
        height: radius,
        width: radius,
        fit: BoxFit.fill,
        placeholder: _getPlaceHolder(placeHolderPos),
        image: imgUrl),
  );
}

ClipRRect loadCircleIcon(
    IconData iconData, Color colors, Color bgColors, double radius) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CircleAvatar(
          radius: radius,
          backgroundColor: bgColors,
          child: IconButton(
            icon: Icon(
              iconData,
              size: radius - 5.0,
              color: colors,
            ),
            onPressed: () {},
          )));
}

String _getPlaceHolder(int placeHolderPos) {
  switch (placeHolderPos) {
    case 0:
      return AssetsConst.LOGO_IMG;
    default:
      return AssetsConst.LOGO_IMG;
  }
}

ClipRRect loadCircleImgName(
    String imgUrl, String name, int placeHolderPos, double radius) {
  Widget circleType;
  if (imgUrl != null) {
    circleType = new FadeInImage.assetNetwork(
        height: radius,
        width: radius,
        fit: BoxFit.fill,
        placeholder: _getPlaceHolder(placeHolderPos),
        image: imgUrl);
  } else {
    circleType = CircleAvatar(
      radius: radius,
      backgroundColor: ColorConst.APP_COLOR,
      child: new Text(
        name.toUpperCase()[0],
        style: new TextStyle(
            fontSize: 20,
            color: ColorConst.WHITE_COLOR,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  return ClipRRect(
      borderRadius: BorderRadius.circular(radius), child: circleType);
}
//  {END LOAD IMAGE}

Divider getDivider() {
  return Divider(
    color: ColorConst.GREY_COLOR,
    height: 1,
  );
}

//  {START TEXT VIEW}
Text getTxt(String message, FontWeight fontsWeight) {
  return Text(message,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: AssetsConst.ZILLASLAB_FONT,
          fontWeight: fontsWeight == null ? FontWeight.normal : fontsWeight));
}

Text getTxtAppColor(String message, double fontsSize, FontWeight fontsWeight) {
  return Text(
    message,
    style: fontsSize == null
        ? _getFontStyle(ColorConst.APP_COLOR, fontsWeight)
        : _getFontSizeStyle(ColorConst.APP_COLOR, fontsSize, fontsWeight),
  );
}

Text getTxtWhiteColor(
    String message, double fontsSize, FontWeight fontsWeight) {
  return Text(
    message,
    style: fontsSize == null
        ? _getFontStyle(ColorConst.WHITE_COLOR, fontsWeight)
        : _getFontSizeStyle(ColorConst.WHITE_COLOR, fontsSize, fontsWeight),
  );
}

Text getTxtBlackColor(
    String message, double fontsSize, FontWeight fontsWeight) {
  return Text(
    message,
    style: fontsSize == null
        ? _getFontStyle(ColorConst.BLACK_COLOR, fontsWeight)
        : _getFontSizeStyle(ColorConst.BLACK_COLOR, fontsSize, fontsWeight),
  );
}

Text getTxtGreyColor(String message, double fontsSize, FontWeight fontsWeight) {
  return Text(
    message,
    style: fontsSize == null
        ? _getFontStyle(ColorConst.GREY_COLOR, fontsWeight)
        : _getFontSizeStyle(ColorConst.GREY_COLOR, fontsSize, fontsWeight),
  );
}

Text getTxtGreyCenterColor(
    String message, double fontsSize, FontWeight fontsWeight) {
  return Text(
    message,
    textAlign: TextAlign.center,
    style: fontsSize == null
        ? _getFontStyle(ColorConst.GREY_COLOR, fontsWeight)
        : _getFontSizeStyle(ColorConst.GREY_COLOR, fontsSize, fontsWeight),
  );
}

Text getTxtWhiteCenterColor(
    String message, double fontsSize, FontWeight fontsWeight) {
  return Text(
    message,
    textAlign: TextAlign.center,
    style: fontsSize == null
        ? _getFontStyle(ColorConst.WHITE_COLOR, fontsWeight)
        : _getFontSizeStyle(ColorConst.WHITE_COLOR, fontsSize, fontsWeight),
  );
}

Text getTxtBlackCenterColor(
    String message, double fontsSize, FontWeight fontsWeight) {
  return Text(
    message,
    textAlign: TextAlign.center,
    style: fontsSize == null
        ? _getFontStyle(ColorConst.BLACK_COLOR, fontsWeight)
        : _getFontSizeStyle(ColorConst.BLACK_COLOR, fontsSize, fontsWeight),
  );
}

Text getTxtColor(
    String message, Color txtColor, double fontsSize, FontWeight fontsWeight) {
  return Text(
    message,
    style: fontsSize == null
        ? _getFontStyle(txtColor, fontsWeight)
        : _getFontSizeStyle(txtColor, fontsSize, fontsWeight),
  );
}

TextStyle _getFontStyle(Color txtColor, FontWeight fontsWeight) {
  return TextStyle(
      color: txtColor,
      decoration: TextDecoration.none,
      fontFamily: AssetsConst.ZILLASLAB_FONT,
      fontWeight: fontsWeight == null ? FontWeight.normal : fontsWeight);
}

TextStyle _getFontSizeStyle(
    Color txtColor, double fontsSize, FontWeight fontsWeight) {
  return TextStyle(
      color: txtColor,
      fontSize: fontsSize,
      decoration: TextDecoration.none,
      fontFamily: AssetsConst.ZILLASLAB_FONT,
      fontWeight: fontsWeight == null ? FontWeight.normal : fontsWeight);
}

//  {END TEXT VIEW}
void showSnackBar(BuildContext context, String message)async {
  try {
    var snackbar = SnackBar(
      content: getTxtWhiteColor(message, null, null),
      backgroundColor: ColorConst.GREEN_COLOR,
      duration: Duration(seconds: 3),
//    action: SnackBarAction(
//        label: "Undo",
//        onPressed: () {
//          logDubug(message + " undo");
//        }),
    );
    await Scaffold.of(context).hideCurrentSnackBar();
    await Scaffold.of(context).showSnackBar(snackbar);
  } catch (e) {
    print('object ' + e.toString());
  }
}

Widget edtNameField(TextEditingController edtController) {
  return TextFormField(
    textCapitalization: TextCapitalization.words,
    controller: edtController,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Full Name",
      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 32,
    validator: ValidationHelper.validateName,
  );
}

Widget edtMobileNoField(TextEditingController edtController) {
  return TextFormField(
    controller: edtController,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Mobile number",
      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 10,
    keyboardType: TextInputType.number,
    validator: ValidationHelper.validateMobile,
  );
}

Widget edtEmailIdField(TextEditingController edtController) {
  return TextFormField(
    controller: edtController,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Email id",
      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    maxLength: 32,
    validator: ValidationHelper.validateEmail,
  );
}

Widget edtDobField(TextEditingController edtController, Function dobClick) {
  return TextFormField(
    onTap: dobClick,
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
    controller: edtController,
    validator: (dob) => ValidationHelper.empty(dob, 'DOB is Required'),
  );
}

Widget edtPwdField(TextEditingController edtController, bool passwordVisible,
    Function pwdVisiableClick) {
  return TextFormField(
    controller: edtController,
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
          onPressed: pwdVisiableClick),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
    ),
    obscureText: !passwordVisible,
    textInputAction: TextInputAction.done,
    maxLength: 32,
    validator: ValidationHelper.validatePassword,
  );
}

Widget raisedBtn(String txt, VoidCallback btnClick) => ButtonTheme(
//    minWidth: double.infinity,
//      height: 40,
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
      child: RaisedButton(
        padding: EdgeInsets.all(5.0),
        color: ColorConst.APP_COLOR,
        child: getTxtWhiteColor(txt, 15, FontWeight.bold),
        onPressed: btnClick,
      ),
    );

Widget raisedRoundBtn(String txt, Function btnClick) => ButtonTheme(
      minWidth: double.infinity,
      height: 45,
      child: RaisedButton(
        shape: StadiumBorder(),
        color: ColorConst.FCM_APP_COLOR,
        child: getTxtWhiteColor(txt, 15, FontWeight.bold),
        onPressed: btnClick,
      ),
    );

Widget raisedRoundAppColorBtn(String txt, Function btnClick) => ButtonTheme(
//  minWidth: double.infinity,
      height: 45,
      child: RaisedButton(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
        shape: StadiumBorder(),
        color: ColorConst.APP_COLOR,
        child: getTxtWhiteColor(txt, 15, FontWeight.bold),
        onPressed: btnClick,
      ),
    );

Widget getSignupImagePicker(
    double imageSize, File filePath, Function imagePickDialog) {
  return Container(
    height: imageSize,
    width: imageSize,
    child: Stack(
      children: <Widget>[
        Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            color: Colors.white,
//              borderRadius: new BorderRadius.only(
//                topLeft: const Radius.circular(40.0),
//                topRight: const Radius.circular(40.0),
//              )
            borderRadius:
                new BorderRadius.all(new Radius.circular(imageSize / 2)),
            border: new Border.all(
              color: ColorConst.FCM_APP_COLOR,
              width: 4.0,
            ),
          ),
          child: ClipOval(
              child: filePath != null
                  ? Image.file(filePath, fit: BoxFit.cover)
                  : IconButton(
                      icon: Icon(
                        Icons.person,
                        size: imageSize / 1.2,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    )),
        ),
        Container(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 45,
              height: 45,
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    new BorderRadius.all(new Radius.circular(imageSize / 2)),
                border: new Border.all(
                  color: ColorConst.FCM_APP_COLOR,
                  width: 2.0,
                ),
              ),
              child: ClipOval(
                  child: IconButton(
                      icon: Icon(
                        Icons.image,
                        color: Colors.grey,
                      ),
                      onPressed: imagePickDialog)),
            )),
      ],
    ),
  );
}

Widget showPbIndicator(bool isLoading) {
  return new Padding(
    padding: const EdgeInsets.all(8.0),
    child: new Center(
      child: new Opacity(
        opacity: isLoading ? 1.0 : 00,
        child: new CircularProgressIndicator(),
      ),
    ),
  );
}
