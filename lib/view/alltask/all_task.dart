import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/alltask/nav_drawer_home.dart';
import 'package:flutterbeginner/view/api/api_call_page.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapsetoolbar_page.dart';
import 'package:flutterbeginner/view/example/barcode_scanner.dart';
import 'package:flutterbeginner/view/example/blend_mode_page.dart';
import 'package:flutterbeginner/view/example/bottom_sheet.dart';
import 'package:flutterbeginner/view/example/bottom_sheet_dragable.dart';
import 'package:flutterbeginner/view/example/calculator_app.dart';
import 'package:flutterbeginner/view/example/camera_gallery.dart';
import 'package:flutterbeginner/view/example/chat_app.dart';
import 'package:flutterbeginner/view/example/device_info_screen.dart';
import 'package:flutterbeginner/view/example/dialog_screen.dart';
import 'package:flutterbeginner/view/example/download_file_screen.dart';
import 'package:flutterbeginner/view/example/finger_print_screen.dart';
import 'package:flutterbeginner/view/example/google_map_screen.dart';
import 'package:flutterbeginner/view/example/grid_view_screen.dart';
import 'package:flutterbeginner/view/example/list_ui.dart';
import 'package:flutterbeginner/view/example/local_jsondata.dart';
import 'package:flutterbeginner/view/example/pagination.dart';
import 'package:flutterbeginner/view/example/permission_helper.dart';
import 'package:flutterbeginner/view/example/push_noti.dart';
import 'package:flutterbeginner/view/example/search_item.dart';
import 'package:flutterbeginner/view/example/share_data_screen.dart';
import 'package:flutterbeginner/view/example/signature_screen.dart';
import 'package:flutterbeginner/view/example/sp_screen.dart';
import 'file:///D:/AndroidStudioProjects/flutter/flutterbeginner/lib/view/splash/splash_page1.dart';
import 'package:flutterbeginner/view/example/stepper_view.dart';
import 'package:flutterbeginner/view/example/swipe_to_delete.dart';
import 'package:flutterbeginner/view/example/swipe_to_refresh.dart';
import 'package:flutterbeginner/view/example/video_player_screen.dart';
import 'package:flutterbeginner/view/example/web_view_screen.dart';
import 'package:flutterbeginner/view/firebase/fcm_social_login.dart';
import 'package:flutterbeginner/view/local/audio/audio_screen.dart';
import 'package:flutterbeginner/view/local/call_log_screen.dart';
import 'package:flutterbeginner/view/local/contact/contact_screen.dart';
import 'package:flutterbeginner/view/local/document/document_screen.dart';
import 'package:flutterbeginner/view/local/image/image_screen.dart';
import 'package:flutterbeginner/view/local/sms_screen.dart';
import 'package:flutterbeginner/view/local/video/video_screen.dart';
import 'package:flutterbeginner/view/login/login_page.dart';
import 'package:flutterbeginner/view/login/login_page2.dart';
import 'package:flutterbeginner/view/navigation/navigation_page.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page.dart';
import 'package:flutterbeginner/view/splash/splash_page.dart';
import 'package:flutterbeginner/view/tabbar/tabbar_page.dart';
import 'package:flutterbeginner/view/widgets/button_widget.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';
import 'package:flutterbeginner/view/widgets/image_widget.dart';
import 'package:flutterbeginner/view/widgets/misc_widget.dart';
import 'package:flutterbeginner/view/widgets/progress_bar_widget.dart';
import 'package:flutterbeginner/view/widgets/text_field_widget.dart';
import 'package:flutterbeginner/view/widgets/text_widget.dart';

class ALLTask extends StatelessWidget {
  final List<String> dataBean = new List();

  @override
  Widget build(BuildContext context) {
    setData();
    return new Scaffold(
      appBar: getAppBar(title: StringConst.FLUTTER_DEMO_TITLE),
      drawer:  NavDrawerHome(),
      body: HomeItemWidget(
        dataBean: dataBean,
        onTap: (screenName) => nextScreen(context, screenName),
      ),
    );
  }

  List<String> setData() {
    dataBean.add("Text");
    dataBean.add("Text Field");
    dataBean.add("Image View");
    dataBean.add("Button");
    dataBean.add("Progress Bar");
    dataBean.add("Misc Widget");
    dataBean.add("Login UI");
    dataBean.add("Read local file JSON");
    dataBean.add("Chat app screen");
    dataBean.add("Calculator");
    dataBean.add("Pagination");
    dataBean.add("API Call");
    dataBean.add("Navigation drawer UI");
    dataBean.add('Stepper');
    dataBean.add('Bottom Navigation');
    dataBean.add('Tab Bar');
    dataBean.add('Shared preference');
    dataBean.add('OnBoarding UI');
    dataBean.add('Splash');
    dataBean.add('Run time permission');
    dataBean.add('Swipe to delete');
    dataBean.add('Firebase');
    dataBean.add('Bottom Sheet');
    dataBean.add('Dragable Bottom Sheet');
    dataBean.add('Image Picker');
    dataBean.add('Dialog');
    dataBean.add('Google map');
    dataBean.add('Swipe To Refresh');
    dataBean.add('Signature');
    dataBean.add('Search Item');
    dataBean.add('Collapse Toolbar');
    dataBean.add('WebView');
    dataBean.add('Barcode Scanner');
    dataBean.add('Video Player');
    dataBean.add('Download File');
    dataBean.add('Push Notification');
    dataBean.add('All Contacts');
    dataBean.add('All SMS');
    dataBean.add('All Images');
    dataBean.add('All Videos');
    dataBean.add('All Audio');
    dataBean.add('All Documents');
    dataBean.add('All Call Log');
    dataBean.add('Grid View');
    dataBean.add('Share Data');
    dataBean.add('Finger Print');
    dataBean.add('Device Info');
    dataBean.add('Login Design');
    dataBean.add('List Ui');
    dataBean.add('Web Socket');
    dataBean.add('Blend Mode');
    return dataBean;
  }

  void nextScreen(BuildContext context, String screenName) {
    switch (screenName) {
      case "Text":
        return navigationPush(context, TextWidget());
      case "Text Field":
        return navigationPush(context, TextFieldWidget());
      case "Image View":
        return navigationPush(context, ImageWidget());
      case "Button":
        return navigationPush(context, ButtonWidget());
      case "Progress Bar":
        return navigationPush(context, ProgressBarWidget());
      case "Misc Widget":
        return navigationPush(context, MiscWidget());
      case "Login UI":
        return navigationStateLessPush(context, LoginPage());
      case "Read local file JSON":
        return navigationPush(context, LocalData());
      case "Chat app screen":
        return navigationPush(context, ChatScreen());
      case "Calculator":
        return navigationPush(context, CalculatorApp());
      case "Pagination":
        return navigationPush(context, Pagination());
      case "API Call":
        return navigationStateLessPush(context, ApiCallPage());
      case "Navigation drawer UI":
        return navigationStateLessPush(context, NavigationPage());
      case 'Stepper':
        return navigationPush(context, StepperView());
      case 'Bottom Navigation':
        return navigationStateLessPush(context, BottomNavPage());
      case 'Tab Bar':
        return navigationStateLessPush(context, TabBarPage());
      case 'Shared preference':
        return navigationPush(context, SPScreen());
      case 'OnBoarding UI':
        return navigationStateLessPush(context, OnboardingPage());
      case 'Splash':
        return navigationStateLessPush(context, SplashPage());
      case 'Run time permission':
        return navigationPush(context, PermissionHelper());
      case 'Swipe to delete':
        return navigationPush(context, SwipeToDelete());
      case 'Firebase':
        return navigationPush(context, FcmSocialLogin());
      case 'Bottom Sheet':
        return navigationPush(context, BottomSheetScreen());
      case 'Dragable Bottom Sheet':
        return navigationPush(context, BottomSheetDragableScreen());
      case 'Image Picker':
        return navigationPush(context, CameraGallery());
      case 'Dialog':
        return navigationPush(context, DialogScreen());
      case 'Google map':
        return navigationPush(context, GoogleMapScreen());
      case 'Swipe To Refresh':
        return navigationPush(context, SwipeToRefresh());
      case 'Signature':
        return navigationPush(context, SignatureScreen());
      case 'Search Item':
        return navigationPush(context, SearchItem());
      case 'Collapse Toolbar':
        return navigationStateLessPush(context, CollapseToolbarPage());
      case 'WebView':
        return navigationPush(context, WebViewScreen());
      case 'Barcode Scanner':
        return navigationPush(context, BarcodeScannerScreen());
      case 'Video Player':
        return navigationPush(
            context, VideoPlayerScreen(ApiConstant.VIDEO_URL, null));
      case 'Download File':
        return navigationPush(context, DownloadFileScreen());
      case 'Push Notification':
        return navigationPush(context, PushNoti());
      case 'All Contacts':
        return navigationPush(context, ContactScreen());
      case 'All SMS':
        return navigationPush(context, SmsScreen());
      case 'All Images':
        return navigationPush(context, ImageScreen());
      case 'All Videos':
        return navigationPush(context, VideoScreen());
      case 'All Audio':
        return navigationPush(context, AudioScreen());
      case 'All Documents':
        return navigationPush(context, DocumentScreen());
      case 'All Call Log':
        return navigationPush(context, CallLogScreen());
      case 'Grid View':
        return navigationPush(context, GridViewScreen());
      case 'Share Data':
        return navigationPush(context, ShareDataScreen());
      case 'Finger Print':
        return navigationPush(context, FingerPrintScreen());
      case 'Device Info':
        return navigationPush(context, DeviceInfoScreen());
      case 'Login Design':
        return navigationPush(context, LoginPage2());
      case 'List Ui':
        return navigationPush(context, ListUiScreen());
      case 'Web Socket':
        return navigationPush(context, ListUiScreen());
      case 'Blend Mode':
        return navigationPush(context, BlendModePage());
      default:
        return navigationPush(context, GridViewScreen());
        break;
    }
  }
}
