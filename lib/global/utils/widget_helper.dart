import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbeginner/global/animation/SlideRoute.dart';
import 'package:flutterbeginner/global/apiutils/api_response.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';
import 'package:flutterbeginner/global/utils/validation_helper.dart';
import 'package:photo_view/photo_view.dart';
//  {START PAGE NAVIGATION}
void navigationPush(BuildContext context, Widget route) {
  Navigator.push(context, MaterialPageRoute(
    // transitionDuration: Duration(seconds: 1),
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

void navigationPushReplacement(BuildContext context, Widget route) {
  Navigator.pushReplacement(context, RouteTransition(widget: route));
}

void delay(BuildContext context, int duration, StatefulWidget route) {
  Future.delayed(const Duration(seconds: 3), () {
    navigationPush(context, route);
  });
}

//  {END PAGE NAVIGATION}
//  {START APPBAR}
AppBar getAppBar(
    {required String title, double? fontSize = 13, List<Widget>? actions,  Color bgColor = Colors.white}) {
  return AppBar(
    backgroundColor: bgColor ?? ColorConst.APP_COLOR,
    centerTitle: true,
    actions: actions,
    title: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 16),
    ),
  );
}

AppBar getAppBarWithBackBtn(
    {required BuildContext ctx,
    String title = '',
    Color bgColor = Colors.white,
    Color txtColor = Colors.black,
    double fontSize = 14,
    Widget? icon,
    List<Widget>? actions,
      TabBar? tabBar}) {
  return AppBar(
    backgroundColor: bgColor ?? ColorConst.APP_COLOR,
    actions: actions,
    leading: icon ?? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () {
              Navigator.pop(ctx);
            }),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          color: txtColor ?? ColorConst.WHITE_COLOR,
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 16),
    ),
    bottom: tabBar,
  );
}

//  {END APPBAR}
//  {START LOAD IMAGE}
FadeInImage loadImg(String url, int placeHolderPos) {
  return FadeInImage.assetNetwork(
      fit: BoxFit.fill,
      placeholder: _getPlaceHolder(placeHolderPos),
      image: url);
}

Widget loadLocalCircleImg(String imagePath, double radius) {
  return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imagePath)
          )
      ));

  //   ClipRRect(
  //   borderRadius: BorderRadius.circular(radius),
  //   child: new FadeInImage.assetNetwork(
  //       height: radius,
  //       width: radius,
  //       fit: BoxFit.fill,
  //       placeholder: imagePath,
  //       image: 'localimagePath'),
  // );
}

ClipRRect loadCircleImg(String imgUrl, int placeHolderPos, double radius) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: FadeInImage.assetNetwork(
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
    String? imgUrl, String name, int placeHolderPos, double radius) {
  Widget circleType;
  if (imgUrl != null) {
    circleType = FadeInImage.assetNetwork(
        height: radius,
        width: radius,
        fit: BoxFit.fill,
        placeholder: _getPlaceHolder(placeHolderPos),
        image: imgUrl);
  } else {
    circleType = CircleAvatar(
      radius: radius,
      backgroundColor: ColorConst.APP_COLOR,
      child: Text(
        name.toUpperCase(),
        style: const TextStyle(
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
  return const Divider(
    color: ColorConst.GREY_COLOR,
    height: 1,
  );
}

//  {START TEXT VIEW}
Text getTxt(
    {required String msg,
    FontWeight? fontWeight,
    int? maxLines,
    TextAlign? textAlign}) {
  return Text(msg,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: AssetsConst.ZILLASLAB_FONT,
          fontWeight: fontWeight ?? FontWeight.normal));
}

Text getTxtAppColor(
    {required String msg,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 1,
    TextAlign? textAlign}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.APP_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtWhiteColor(
    {required String msg,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign? textAlign}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.WHITE_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtBlackColor(
    {required String msg,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign? textAlign}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: ColorConst.BLACK_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtGreyColor(
    {required String msg,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 1,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: ColorConst.GREY_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtColor(
    {required String msg,
    required Color txtColor,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 1,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: txtColor, fontSize: fontSize, fontWeight: fontWeight),
  );
}

TextStyle _getFontStyle(
    {Color? txtColor,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    TextDecoration? txtDecoration}) {
  return TextStyle(
      color: txtColor,
      fontSize: fontSize ?? 14,
      decoration: txtDecoration ?? TextDecoration.none,
      fontFamily: fontFamily ?? AssetsConst.ZILLASLAB_FONT,
      fontWeight: fontWeight ?? FontWeight.normal);
}

//  {END TEXT VIEW}
void showSnackBar(BuildContext context, String message) async {
  try {
    var snackbar = SnackBar(
      content: getTxtWhiteColor(msg: message),
      backgroundColor: ColorConst.GREEN_COLOR,
      duration: const Duration(seconds: 3),
//    action: SnackBarAction(
//        label: "Undo",
//        onPressed: () {
//          logDubug(message + " undo");
//        }),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  } catch (e) {
    printLog(msg: 'object $e');
  }
}

Widget edtNameField(TextEditingController edtController) {
  return TextFormField(
    textCapitalization: TextCapitalization.words,
    controller: edtController,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Full Name",
      hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Mobile number",
      hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Email id",
      hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.emailAddress,
    maxLength: 32,
    validator: ValidationHelper.validateEmail,
  );
}

Widget edtDobField(TextEditingController edtController, Function dobClick) {
  return TextFormField(
    onTap: dobClick(),
    decoration: InputDecoration(
      counterText: '',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "DOB",
      hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 32,
    readOnly: true,
    controller: edtController,
    validator: (dob) => ValidationHelper.empty(dob!, 'DOB is Required'),
  );
}

Widget edtPwdField(TextEditingController edtController, bool passwordVisible,
    Function() pwdVisibleClick) {
  return TextFormField(
    controller: edtController,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Password",
      suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed:()=> pwdVisibleClick()),
      hintStyle: const TextStyle(
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
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
      child: MaterialButton(
        padding: const EdgeInsets.all(5.0),
        color: ColorConst.APP_COLOR,
        onPressed: btnClick,
        child: getTxtWhiteColor(
            msg: txt, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );

Widget raisedRoundBtn(String txt, Function btnClick) => ButtonTheme(
      minWidth: double.infinity,
      height: 45,
      child: MaterialButton(
        shape: const StadiumBorder(),
        color: ColorConst.FCM_APP_COLOR,
        onPressed: btnClick(),
        child: getTxtWhiteColor(
            msg: txt, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );

Widget raisedRoundAppColorBtn(String txt, Function btnClick) => ButtonTheme(
//  minWidth: double.infinity,
      height: 45,
      child: MaterialButton(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
        shape: const StadiumBorder(),
        color: ColorConst.APP_COLOR,
        onPressed: btnClick(),
        child: getTxtWhiteColor(
            msg: txt, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );

Widget getSignupImagePicker(
    double imageSize, File filePath, Function imagePickDialog) {
  return SizedBox(
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
                BorderRadius.all(Radius.circular(imageSize / 2)),
            border: Border.all(
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
                    BorderRadius.all(Radius.circular(imageSize / 2)),
                border: Border.all(
                  color: ColorConst.FCM_APP_COLOR,
                  width: 2.0,
                ),
              ),
              child: ClipOval(
                  child: IconButton(
                      icon: const Icon(
                        Icons.image,
                        color: Colors.grey,
                      ),
                      onPressed: imagePickDialog())),
            )),
      ],
    ),
  );
}

Widget showPbIndicator() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Center(
      child: Opacity(
        opacity: 1.0,
        child: CircularProgressIndicator(),
      ),
    ),
  );
}

Widget apiHandler<T>(
    {required ApiResponse<T> response, Widget? loading, Widget? error}) {
  switch (response.status) {
    case ApiStatus.loading:
      return loading ?? GetLoadingWidget();
    case ApiStatus.error:
      return error ?? GetErrorWidget(
              errorMessage: response.apiError!.errorMessage,
              onRetryPressed: () {
                //call api
              },
            );
    default:{
        return Container(
          color: Colors.amber,
        );
      }
  }
}
class GetErrorWidget extends StatelessWidget {
  final String? errorMessage;

  final Function? onRetryPressed;
  const GetErrorWidget({super.key, this.errorMessage, this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ColorConst.APP_COLOR,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          MaterialButton(
            color: ColorConst.APP_COLOR,
            onPressed: onRetryPressed!(),
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

class GetLoadingWidget extends StatelessWidget {
   String message = "please wait...";
   GetLoadingWidget({super.key, this.message = "please wait..."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorConst.APP_COLOR),
          ),
          const SizedBox(height: 24),
          Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ColorConst.APP_COLOR,
              fontSize: 24,
            ),
          ),

        ],
      ),
    );
  }
}

Future<Future<bool?>> onWillPop(BuildContext context) async {
  return showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: getTxtColor(
              msg: "Are you sure you want to exit this app?",
              fontSize: 17,
              txtColor: ColorConst.BLACK_COLOR),
          title: getTxtBlackColor(
              msg: "Warning!", fontSize: 18, fontWeight: FontWeight.bold),
          actions: <Widget>[
            MaterialButton(
                child: getTxtBlackColor(
                  msg: "Yes",
                  fontSize: 17,
                ),
                onPressed: () => SystemNavigator.pop()),
            MaterialButton(
                child: getTxtBlackColor(
                  msg: "No",
                  fontSize: 17,
                ),
                onPressed: () => Navigator.pop(context)),
          ],
        );
      });
}

Widget getCacheImage({required String url, double? height, double? width}) {
  return Container();
  // return CachedNetworkImage(
  //   fit: BoxFit.cover,
  //   width: width ?? double.infinity,
  //   height: height ?? double.infinity,
  //   imageUrl: url,
  //   placeholder: (context, url) => Container(
  //     width: width ?? double.infinity,
  //     height: height ?? double.infinity,
  //     color: Colors.grey[400],
  //   ),
  //   errorWidget: (context, url, error) => const Icon(Icons.error),
  // );
}

showImageDialog({BuildContext? context, String? imageFile}) {
  var imageFileProvider;
  // if (imageFile != null)
  //   imageFileProvider = FileImage(imageFile);
  // else
    imageFileProvider = NetworkImage(imageFile!);
  showDialog(
    context: context!,
    builder: (_) => Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child:  PhotoView(
                imageProvider: imageFileProvider,
                minScale: PhotoViewComputedScale.contained * 0.8,
                maxScale: PhotoViewComputedScale.covered * 2,
                enableRotation: true,
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 10.0),
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget addRoundedCorners(Widget widget) => ClipRRect(borderRadius: BorderRadius.circular(4.0), child: widget);
