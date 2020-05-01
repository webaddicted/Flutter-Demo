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

String _getPlaceHolder(int placeHolderPos) {
  switch (placeHolderPos) {
    case 0:
      return AssetsConst.LOGO_IMG;
    default:
      return AssetsConst.LOGO_IMG;
  }
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

void showSnackBar(BuildContext context, String message) {
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
  Scaffold.of(context).showSnackBar(snackbar);
}

showAlertDialog(BuildContext context, String title, String msg) {
  showDialog(
      context: context,
      child: new AlertDialog(
        title: getTxtBlackColor(title, null, FontWeight.bold),
        content: getTxt(msg, null),
      ));
}

Widget buildTextFied(
    BuildContext context, String labelText, Color fieldColor, bool isPassowrd) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Theme(
      data: Theme.of(context).copyWith(
        primaryColor: fieldColor, //.withOpacity(0.5),
      ),
      child: TextField(
        obscureText: isPassowrd,
        focusNode: FocusNode(),
        style: TextStyle(
          color: fieldColor,
        ),
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: fieldColor) //.withOpacity(0.7)),
            ),
      ),
    ),
  );
}

Widget edtNameField(String fullName, TextEditingController edtController) {
  return TextFormField(
    textCapitalization: TextCapitalization.words,
    controller: edtController ,
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
    onSaved: (String val) => fullName = val,
  );
}

Widget edtMobileNoField(String mobileNo, TextEditingController edtController) {
  return TextFormField(
    controller: edtController ,
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
    onSaved: (String val) => mobileNo = val,
  );
}

Widget emailIdField(String emailIdTxt, TextEditingController edtController) {
  return TextFormField(
    controller: edtController ,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Email id",
      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 32,
    validator: ValidationHelper.validateEmail,
    onSaved: (String val) => emailIdTxt = val,
  );
}
Widget dummyRaisedBtn(String txt, Color btnColor){
  return ButtonTheme(
    minWidth: double.infinity,
    height: 45,
    child: RaisedButton(
      color: btnColor,
      child: getTxtWhiteColor(txt, 15, FontWeight.bold),
      onPressed: () {},
    ),
  );
}
