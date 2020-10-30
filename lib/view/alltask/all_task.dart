import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
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
import 'package:flutterbeginner/view/example/page_view.dart';
import 'package:flutterbeginner/view/example/pagination.dart';
import 'package:flutterbeginner/view/example/permission_helper.dart';
import 'package:flutterbeginner/view/example/reorder_list.dart';
import 'package:flutterbeginner/view/example/screenshot_page.dart';
import 'package:flutterbeginner/view/example/search_item.dart';
import 'package:flutterbeginner/view/example/share_data_screen.dart';
import 'package:flutterbeginner/view/example/signature_screen.dart';
import 'package:flutterbeginner/view/example/sp_screen.dart';
import 'package:flutterbeginner/view/example/staggered_grid_view.dart';
import 'package:flutterbeginner/view/example/stepper_view.dart';
import 'package:flutterbeginner/view/example/swipe_to_delete.dart';
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
import 'package:flutterbeginner/view/navigation/navigation_page.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page.dart';
import 'package:flutterbeginner/view/pulltorefresh/pull_to_refresh_page.dart';
import 'package:flutterbeginner/view/splash/splash_page.dart';
import 'package:flutterbeginner/view/tabbar/tabbar_page.dart';
import 'package:flutterbeginner/view/widgets/button_widget.dart';
import 'package:flutterbeginner/view/widgets/home_item_widget.dart';
import 'package:flutterbeginner/view/widgets/image_widget.dart';
import 'package:flutterbeginner/view/widgets/misc_widget.dart';
import 'package:flutterbeginner/view/widgets/progress_bar_widget.dart';
import 'package:flutterbeginner/view/widgets/text_field_widget.dart';
import 'package:flutterbeginner/view/widgets/text_widget.dart';

class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  List<String> dataBean = new List();
  List<String> searchDataBean = new List();
  BuildContext ctx;
  bool _reverseSort = true;
  SearchBar searchBar;

  _AllTasksState() {
    searchBar = SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onChanged: onDataChange,
        onCleared: () {
          onDataChange("");
          // print("cleared");
        },
        onClosed: () {
          onDataChange("");
          // print("closed");
        });
  }

  void onDataChange(String value) {
    try {
      searchDataBean = dataBean
          .where((e) =>
              (e.toUpperCase().contains(value.toUpperCase())) ||
              e.toUpperCase().contains(value.toUpperCase()))
          .toList();
      // searchDataBean = dataBean
      //     .where((e) =>
      // (e.name.toUpperCase().contains(value.toUpperCase())) ||
      //     e.mobileNo.toUpperCase().contains(value.toUpperCase()))
      //     .toList();
      setState(() {});
      print("List : ${searchDataBean.length}  ${dataBean.length}");
    } catch (exp) {
      print('Search exp: $exp');
    }
  }

  @override
  void initState() {
    setData();
    dataBean.sort((a, b) => a.compareTo(b));
    searchDataBean = dataBean;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      appBar: searchBar.build(context),
      drawer: NavDrawerHome(),
      body: HomeItemWidget(
        dataBean: searchDataBean,
        onTap: (screenName) => nextScreen(context, screenName),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return getAppBar(
        title: StringConst.FLUTTER_DEMO_TITLE, actions: [
      IconButton(
          icon: const Icon(Icons.sort_by_alpha),
          tooltip: 'Sort',
          onPressed: () {
            _reverseSort = !_reverseSort;
            setState(() {
              if (_reverseSort)
                searchDataBean.sort((a, b) => a.compareTo(b));
              else
                searchDataBean.sort((a, b) => b.compareTo(a));
              // _items.sort((_ListItem a, _ListItem b) => _reverseSort
              //     ? b.value.compareTo(a.value)
              //     : a.value.compareTo(b.value));
            });
          }),
      searchBar.getSearchAction(context),
      IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
    ]);
  }

  List<String> setData() {
    dataBean.add("Text");
    dataBean.add("Text Field");
    dataBean.add("Image View");
    dataBean.add("Button");
    dataBean.add("Progress Bar");
    dataBean.add("Misc Widget");
    dataBean.add("Login UI Design");
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
    dataBean.add('Pull To Refresh');
    dataBean.add('Signature');
    dataBean.add('Search Item');
    dataBean.add('Collapse Toolbar');
    dataBean.add('WebView');
    dataBean.add('Barcode Scanner');
    dataBean.add('Video Player');
    dataBean.add('Download File');
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
    dataBean.add('List Ui');
    dataBean.add('Screenshot');
    dataBean.add('Blend Mode');
    dataBean.add('ReOreder List');
    dataBean.add('View Pager');
    dataBean.add('Staggered Grid view');
    dataBean.add('ZZZZ');
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
      case "Login UI Design":
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
      case 'Pull To Refresh':
        return navigationStateLessPush(context, PullToRefreshPage());
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
      case 'List Ui':
        return navigationPush(context, ListUiScreen());
      case 'Screenshot':
        return navigationPush(context, ScreenshotPage());
      case 'Blend Mode':
        return navigationPush(context, BlendModePage());
      case 'ReOreder List':
        return navigationPush(context, ReorderPage());
      case 'View Pager':
        return navigationPush(context, PageViewScreen());
      case 'Staggered Grid view':
        return navigationPush(context, StaggeredGridScreen());
      case 'ZZZZ':
        return navigationPush(context, StaggeredGridScreen());
      default:
        return navigationPush(context, GridViewScreen());
        break;
    }
  }
}
