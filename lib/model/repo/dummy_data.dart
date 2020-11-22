import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/view/api/api_dio_arch_page.dart';
import 'package:flutterbeginner/view/api/api_dio_page.dart';
import 'package:flutterbeginner/view/api/api_http_page.dart';
import 'package:flutterbeginner/view/api/git_https_users.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page1.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page2.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page3.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page4.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page5.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page6.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page7.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_arc_page2.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_fab_zoom_out.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_fade_appbar.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_page3.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_page4.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapse_zoom_img_page2.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapsetoolbar_page1.dart';
import 'package:flutterbeginner/view/collapsetoolbar/wave_appbar.dart';
import 'package:flutterbeginner/view/details/detail_page1.dart';
import 'package:flutterbeginner/view/details/detail_page2.dart';
import 'package:flutterbeginner/view/details/detail_page3.dart';
import 'package:flutterbeginner/view/details/detail_page4.dart';
import 'package:flutterbeginner/view/details/detail_page5.dart';
import 'package:flutterbeginner/view/details/detail_page6.dart';
import 'package:flutterbeginner/view/details/detail_page7.dart';
import 'package:flutterbeginner/view/example/animation_page.dart';
import 'package:flutterbeginner/view/example/barcode_scanner.dart';
import 'package:flutterbeginner/view/example/blend_mode_page.dart';
import 'package:flutterbeginner/view/example/blur_effect_page.dart';
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
import 'package:flutterbeginner/view/example/local_jsondata.dart';
import 'package:flutterbeginner/view/example/page_view.dart';
import 'package:flutterbeginner/view/example/pagination.dart';
import 'package:flutterbeginner/view/example/permission_helper.dart';
import 'package:flutterbeginner/view/example/reorder_list.dart';
import 'package:flutterbeginner/view/example/screenshot_page.dart';
import 'package:flutterbeginner/view/example/share_data_screen.dart';
import 'package:flutterbeginner/view/example/signature_screen.dart';
import 'package:flutterbeginner/view/example/sp_screen.dart';
import 'package:flutterbeginner/view/example/staggered_grid_view.dart';
import 'package:flutterbeginner/view/example/stepper_view.dart';
import 'package:flutterbeginner/view/example/swipe_to_delete.dart';
import 'package:flutterbeginner/view/example/video_player_screen.dart';
import 'package:flutterbeginner/view/example/web_view_screen.dart';
import 'package:flutterbeginner/view/firebase/fcm_social_login.dart';
import 'package:flutterbeginner/view/home/home_page1.dart';
import 'package:flutterbeginner/view/home/home_page2.dart';
import 'package:flutterbeginner/view/home/home_page3.dart';
import 'package:flutterbeginner/view/home/home_page4.dart';
import 'package:flutterbeginner/view/home/home_page5.dart';
import 'package:flutterbeginner/view/home/home_page6.dart';
import 'package:flutterbeginner/view/list/list_cart_item_page1.dart';
import 'package:flutterbeginner/view/list/list_cart_item_page2.dart';
import 'package:flutterbeginner/view/list/list_cart_item_page3.dart';
import 'package:flutterbeginner/view/list/list_page1.dart';
import 'package:flutterbeginner/view/list/list_page2.dart';
import 'package:flutterbeginner/view/local/audio/audio_screen.dart';
import 'package:flutterbeginner/view/local/call_log_screen.dart';
import 'package:flutterbeginner/view/local/contact/contact_screen.dart';
import 'package:flutterbeginner/view/local/document/document_screen.dart';
import 'package:flutterbeginner/view/local/image/image_screen.dart';
import 'package:flutterbeginner/view/local/sms_screen.dart';
import 'package:flutterbeginner/view/local/video/video_screen.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/login/login_page10.dart';
import 'package:flutterbeginner/view/login/login_page12.dart';
import 'package:flutterbeginner/view/login/login_page13.dart';
import 'package:flutterbeginner/view/login/login_page2.dart';
import 'package:flutterbeginner/view/login/login_page3.dart';
import 'package:flutterbeginner/view/login/login_page4.dart';
import 'package:flutterbeginner/view/login/login_page5.dart';
import 'package:flutterbeginner/view/login/login_page6.dart';
import 'package:flutterbeginner/view/login/login_page7.dart';
import 'package:flutterbeginner/view/login/login_page8.dart';
import 'package:flutterbeginner/view/login/login_page9.dart';
import 'package:flutterbeginner/view/login/login_wave_page11.dart';
import 'package:flutterbeginner/view/login/login_welcome_page.dart';
import 'package:flutterbeginner/view/login/login_welcome_page2.dart';
import 'package:flutterbeginner/view/navigation/nav_back_drop_drawer.dart';
import 'package:flutterbeginner/view/navigation/nav_behavior_page.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer_bothside.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer_curve_page.dart';
import 'package:flutterbeginner/view/navigation/nav_drawer_slide_page.dart';
import 'package:flutterbeginner/view/navigation/nav_drop_down.dart';
import 'package:flutterbeginner/view/navigation/nav_like_frag_page.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page1.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page2.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page3.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page4.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page5.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page6.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page7.dart';
import 'package:flutterbeginner/view/profile/profile_page1.dart';
import 'package:flutterbeginner/view/profile/profile_page2.dart';
import 'package:flutterbeginner/view/profile/profile_page3.dart';
import 'package:flutterbeginner/view/profile/profile_page4.dart';
import 'package:flutterbeginner/view/profile/profile_page5.dart';
import 'package:flutterbeginner/view/profile/profile_page6.dart';
import 'package:flutterbeginner/view/profile/profile_page7.dart';
import 'package:flutterbeginner/view/profile/profile_page8.dart';
import 'package:flutterbeginner/view/pulltorefresh/pull_to_refresh.dart';
import 'package:flutterbeginner/view/pulltorefresh/water_drop.dart';
import 'package:flutterbeginner/view/pulltorefresh/water_drop_material.dart';
import 'package:flutterbeginner/view/settings/setting_page1.dart';
import 'package:flutterbeginner/view/settings/setting_page2.dart';
import 'package:flutterbeginner/view/settings/setting_page3.dart';
import 'package:flutterbeginner/view/settings/setting_page4.dart';
import 'package:flutterbeginner/view/splash/splash_page1.dart';
import 'package:flutterbeginner/view/splash/splash_page2.dart';
import 'package:flutterbeginner/view/splash/splash_page3.dart';
import 'package:flutterbeginner/view/tabbar/tab_page1.dart';
import 'package:flutterbeginner/view/tabbar/tab_page2.dart';
import 'package:flutterbeginner/view/tabbar/tab_page3.dart';
import 'package:flutterbeginner/view/test.dart';
import 'package:flutterbeginner/view/widgets/button_widget.dart';
import 'package:flutterbeginner/view/widgets/image_widget.dart';
import 'package:flutterbeginner/view/widgets/misc_widget.dart';
import 'package:flutterbeginner/view/widgets/progress_bar_widget.dart';
import 'package:flutterbeginner/view/widgets/text_field_widget.dart';
import 'package:flutterbeginner/view/widgets/text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<String> dummyImgList = [
  'https://wallpapercave.com/wp/wp2519534.jpg',
  'https://pluspng.com/img-png/vodafone-zoo-zoo-png-zoo-zoo-zoo-zoo-zoo-zoo-660.jpg',
  'https://webneel.com/daily/sites/default/files/images/daily/05-2013/zoozoo-vodafone-wallpaper-10.jpg',
  'https://webneel.com/daily/sites/default/files/images/daily/05-2013/zoozoo-vodafone-wallpaper-4.jpg',
  'https://i.pinimg.com/originals/e5/22/11/e52211d7ed30172145da8ec17574d8e7.jpg',
];
final List<TaskItem> categories = [
  TaskItem.normal("General Knowledge", icon: FontAwesomeIcons.globeAsia),
  TaskItem.normal("Books", icon: FontAwesomeIcons.bookOpen),
  TaskItem.normal("Film", icon: FontAwesomeIcons.video),
  TaskItem.normal("Music", icon: FontAwesomeIcons.music),
  TaskItem.normal("Musicals & Theatres", icon: FontAwesomeIcons.theaterMasks),
  TaskItem.normal("Television", icon: FontAwesomeIcons.tv),
  TaskItem.normal("Video Games", icon: FontAwesomeIcons.gamepad),
  TaskItem.normal("Board Games", icon: FontAwesomeIcons.chessBoard),
  TaskItem.normal("Science & Nature", icon: FontAwesomeIcons.microscope),
  TaskItem.normal("Computer", icon: FontAwesomeIcons.laptopCode),
  TaskItem.normal("Maths", icon: FontAwesomeIcons.sortNumericDown),
  TaskItem.normal("Mythology"),
  TaskItem.normal("Sports", icon: FontAwesomeIcons.footballBall),
  TaskItem.normal("Geography", icon: FontAwesomeIcons.mountain),
  TaskItem.normal("History", icon: FontAwesomeIcons.monument),
  TaskItem.normal("Politics"),
  TaskItem.normal("Art", icon: FontAwesomeIcons.paintBrush),
  TaskItem.normal("Celebrities"),
  TaskItem.normal("Animals", icon: FontAwesomeIcons.dog),
  TaskItem.normal("Vehicles", icon: FontAwesomeIcons.carAlt),
  TaskItem.normal("Comics"),
  TaskItem.normal("Gadgets", icon: FontAwesomeIcons.mobileAlt),
  TaskItem.normal("Japanese Anime & Manga"),
  TaskItem.normal("Cartoon & Animation"),
];
List<String> dummypopulateData = [
  'https://i.pinimg.com/originals/66/59/44/665944970605ed2273788a068895ea39.jpg',
  'https://www.pikpng.com/pngl/m/322-3223733_free-png-download-mickey-mouse-clipart-png-photo.png',
  'https://images.unsplash.com/photo-1519501025264-65ba15a82390?ixlib=rb-1.2.1&w=1000&q=80',
  'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg',
  'https://www.pinclipart.com/picdir/middle/11-112919_minnie-mouse-free-clip-art-image-clipart-minnie.png',
  'http://paranoidandroid.co/assets/wallpapers/2018/submerged_desktop_thumb.jpg',
  'https://images.pexels.com/photos/799443/pexels-photo-799443.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg',
  'https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://cdn.statically.io/img/wallpaperaccess.com/full/946372.jpg',
  'https://www.pinclipart.com/picdir/middle/144-1442860_mickey-mouse-transparent-mickey-mouse-png-transparent-mickey.png',
];
List<String> dummyLargeData = [
  'https://images.unsplash.com/photo-1519501025264-65ba15a82390?ixlib=rb-1.2.1&w=1000&q=80',
  'https://i.pinimg.com/originals/66/59/44/665944970605ed2273788a068895ea39.jpg',
  'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg',
  'https://images.pexels.com/photos/799443/pexels-photo-799443.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg',
  'https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://cdn.statically.io/img/wallpaperaccess.com/full/946372.jpg',
  'https://www.pinclipart.com/picdir/middle/221-2213824_clip-transparent-download-friends-clipart-free-mickey-mouse.png',
  'https://toppng.com/uploads/preview/svg-black-and-white-download-mickey-mouse-and-clip-mickey-and-friends-11563013801syndd9rkku.png',
  'https://pluspng.com/img-png/vodafone-zoo-zoo-png-zoo-zoo-zoo-zoo-zoo-zoo-660.jpg',
  'https://wallpapercave.com/wp/wp2519534.jpg',
  'https://webneel.com/daily/sites/default/files/images/daily/05-2013/zoozoo-vodafone-wallpaper-10.jpg',
  'https://webneel.com/daily/sites/default/files/images/daily/05-2013/zoozoo-vodafone-wallpaper-4.jpg',
  'https://i.pinimg.com/originals/e5/22/11/e52211d7ed30172145da8ec17574d8e7.jpg',
  'https://www.pikpng.com/pngl/m/322-3223733_free-png-download-mickey-mouse-clipart-png-photo.png',
  'https://www.pinclipart.com/picdir/middle/11-112919_minnie-mouse-free-clip-art-image-clipart-minnie.png',
  'http://paranoidandroid.co/assets/wallpapers/2018/submerged_desktop_thumb.jpg',
  'https://www.pinclipart.com/picdir/middle/144-1442860_mickey-mouse-transparent-mickey-mouse-png-transparent-mickey.png',
];
List<String> dummyLargeFoodData = [
  'https://drop.ndtv.com/albums/COOKS/pasta-vegetarian/pastaveg_640x480.jpg',
  'https://currybowlla.com/assets/images/gallery/3-big.jpg',
  'http://danamandi.ca/wp-content/uploads/2016/04/Food-Gallery-Indian-Essence-Restaurant-13.jpg',
  'https://media-cdn.tripadvisor.com/media/photo-s/0e/1c/e4/83/awesome-food-to-enjoy.jpg',
  'https://i.ndtvimg.com/i/2017-08/620-istock-chila_620x350_61502216031.jpg',
  'https://foodtrainonline.com/blog/wp-content/uploads/2018/09/4454048-food-wallpapers.jpg',
  'https://www.lark.com/wp-content/uploads/2020/06/shutterstock_1016078281.jpg',
  'https://i.ytimg.com/vi/1N9pvd4DWMM/maxresdefault.jpg',
  'https://www.kohinoorfoods.co.uk/wp-content/uploads/2020/01/indo-chinese-food.jpg',
  'https://c.ndtvimg.com/2020-01/dd46j918_chilli-chicken_625x300_21_January_20.jpg',
  'https://i.ndtvimg.com/i/2016-06/noodles-625_625x350_41466064269.jpg',
  'https://i.ndtvimg.com/i/2015-02/spring-roll_625x350_51424323845.jpg',
  'https://i.ytimg.com/vi/MoZAkumC7ps/hqdefault.jpg',
  'https://data.chinatravel.com/images/facts/chinese-food/sweet-and-sour-pork.jpg',
  'https://sites.psu.edu/wanyingpassion/wp-content/uploads/sites/6105/2013/09/%E9%BA%BB%E5%A9%86%E8%B1%86%E8%85%90.jpg',
  'https://akm-img-a-in.tosshub.com/sites/btmt/images/stories/momo_660_060817115337.jpg',
];
List<TaskItem> taskItem = [
  TaskItem(
      title: 'Text',
      page: TextWidget('lib/view/widgets/text_widget.dart'),
      codePreview: 'lib/view/widgets/text_widget.dart'),
  TaskItem(
      title: 'Text Field',
      page: TextFieldWidget(),
      codePreview: 'lib/view/widgets/text_field_widget.dart'),
  TaskItem(
      title: 'Image View',
      page: ImageWidget(),
      codePreview: 'lib/view/widgets/image_widget.dart'),
  TaskItem(
      title: 'Button',
      page: ButtonWidget(),
      codePreview: 'lib/view/widgets/button_widget.dart'),
  TaskItem(
      title: 'Progress Bar',
      page: ProgressBarWidget(),
      codePreview: 'lib/view/widgets/progress_bar_widget.dart'),
  TaskItem(
      title: 'Misc Widget',
      page: MiscWidget(),
      codePreview: 'lib/view/widgets/misc_widget.dart'),
  TaskItem(
      title: 'Read local file JSON',
      page: LocalData(),
      codePreview: 'lib/view/example/local_jsondata.dart'),
  TaskItem(
      title: 'Chat app screen',
      page: ChatScreen(),
      codePreview: 'lib/view/example/chat_app.dart'),
  TaskItem(
      title: 'Calculator',
      page: CalculatorApp(),
      codePreview: 'lib/view/example/calculator_app.dart'),
  TaskItem(
      title: 'Pagination',
      page: Pagination(),
      codePreview: 'lib/view/example/pagination.dart'),
  TaskItem(
      title: 'Stepper',
      page: StepperView(),
      codePreview: 'lib/view/example/stepper_view.dart'),
  TaskItem(
      title: 'Shared preference',
      page: SPScreen(),
      codePreview: 'lib/view/example/sp_screen.dart'),
  TaskItem(
      title: 'Run time permission',
      page: PermissionHelper(),
      codePreview: 'lib/view/example/permission_helper.dart'),
  TaskItem(
      title: 'Swipe to delete',
      page: SwipeToDelete(),
      codePreview: 'lib/view/example/swipe_to_delete.dart'),
  TaskItem(
      title: 'Firebase',
      page: FcmSocialLogin(),
      codePreview: 'lib/view/firebase/fcm_social_login.dart'),
  TaskItem(
      title: 'Bottom Sheet',
      page: BottomSheetScreen(),
      codePreview: 'lib/view/example/bottom_sheet.dart'),
  TaskItem(
      title: 'Dragable Bottom Sheet',
      page: BottomSheetDragableScreen(),
      codePreview: 'lib/view/example/bottom_sheet_dragable.dart'),
  TaskItem(
      title: 'Image Picker',
      page: CameraGallery(),
      codePreview: 'lib/view/example/camera_gallery.dart'),
  TaskItem(
      title: 'Dialog',
      page: DialogScreen(),
      codePreview: 'lib/view/example/dialog_screen.dart'),
  TaskItem(
      title: 'Google map',
      page: GoogleMapScreen(),
      codePreview: 'lib/view/example/google_map_screen.dart'),
  TaskItem(
      title: 'Signature',
      page: SignatureScreen(),
      codePreview: 'lib/view/example/signature_screen.dart'),
  TaskItem(
      title: 'WebView',
      page: WebViewScreen(),
      codePreview: 'lib/view/example/web_view_screen.dart'),
  TaskItem(
      title: 'Barcode Scanner',
      page: BarcodeScannerScreen(),
      codePreview: 'lib/view/example/barcode_scanner.dart'),
  TaskItem(
      title: 'Video Player',
      page: VideoPlayerScreen(ApiConstant.VIDEO_URL, null),
      codePreview: 'lib/view/example/video_player.dart'),
  TaskItem(
      title: 'Download File',
      page: DownloadFileScreen(),
      codePreview: 'lib/view/example/dowload_file_screen.dart'),
  TaskItem(
      title: 'All Contacts',
      page: ContactScreen(),
      codePreview: 'lib/view/local/contact/contact_screen.dart'),
  TaskItem(
      title: 'All SMS',
      page: SmsScreen(),
      codePreview: 'lib/view/local/sms_scren.dart'),
  TaskItem(
      title: 'All Images',
      page: ImageScreen(),
      codePreview: 'lib/view/local/image/image_folder.dart'),
  TaskItem(
      title: 'All Videos',
      page: VideoScreen(),
      codePreview: 'lib/view/local/video/video_folder.dart'),
  TaskItem(
      title: 'All Audio',
      page: AudioScreen(),
      codePreview: 'lib/view/local/audio/audio_screen.dart'),
  TaskItem(
      title: 'All Documents',
      page: DocumentScreen(),
      codePreview: 'lib/view/local/video/document_folder.dart'),
  TaskItem(
      title: 'All Call Log',
      page: CallLogScreen(),
      codePreview: 'lib/view/local/call_log_screen.dart'),
  TaskItem(
      title: 'Grid View',
      page: GridViewScreen(),
      codePreview: 'lib/view/example/grid_view_screen.dart'),
  TaskItem(
      title: 'Share Data',
      page: ShareDataScreen(),
      codePreview: 'lib/view/example/share_data_screen.dart'),
  TaskItem(
      title: 'Finger Print',
      page: FingerPrintScreen(),
      codePreview: 'lib/view/example/finger_print_screen.dart'),
  TaskItem(
      title: 'Device Info',
      page: DeviceInfoScreen(),
      codePreview: 'lib/view/example/device_info_screen.dart'),
  TaskItem(
      title: 'Screenshot',
      page: ScreenshotPage(),
      codePreview: 'lib/view/example/screenshot_page.dart'),
  TaskItem(
      title: 'Blend Mode (Image Filter)',
      page: BlendModePage(),
      codePreview: 'lib/view/example/blend_mode_page.dart'),
  TaskItem(
      title: 'ReOreder List',
      page: ReorderPage(),
      codePreview: 'lib/view/example/reorder_list.dart'),
  TaskItem(
      title: 'View Pager',
      page: PageViewScreen(),
      codePreview: 'lib/view/example/page_view.dart'),
  TaskItem(
      title: 'Staggered Grid view',
      page: StaggeredGridScreen(),
      codePreview: 'lib/view/example/staggered_grid_view.dart'),
  TaskItem(
      title: 'Splash Design',
      subItem: splashPageItem),
  TaskItem(
      title: 'OnBoarding UI Design',
      subItem: onboardingPageItem),
  TaskItem(
      title: 'Login UI Design',
      subItem: loginPageItem),
  TaskItem(
      title: 'Home UI Design',
      subItem: homeItem),
  TaskItem(
      title: 'Profile UI Design',
      subItem: profileItem),
  TaskItem(
      title: 'Details UI Design',
      subItem: detailsItem),
  TaskItem(
      title: 'Setting UI Design',
      subItem: settingPageItem),
  TaskItem(
      title: 'Pull To Refresh Design',
      subItem: pullToRefreshItem),
  TaskItem(
      title: 'Collapse Toolbar Design',
      subItem: collapseToolbarItem),
  TaskItem(
      title: 'List Ui Design',
      subItem: listPageItem),
  TaskItem(
      title: 'Bottom Navigation Design',
      subItem: bottomNavItem),
  TaskItem(
      title: 'Tab Bar Design',
      subItem: tabBarPageItem),
  TaskItem(
      title: 'API Call Design',
      subItem: apiCallItem),
  TaskItem(
      title: 'Navigation drawer UI Design',
      subItem: navPageItem),
  TaskItem(
      title: 'Blur effect',
      page: BlurEffectPage(),
      codePreview: 'view/example/blur_effect_page.dart'),
  TaskItem(
      title: 'Animation',
      page: AnimationPage(),
      codePreview: 'view/example/animation_page.dart'),
  TaskItem(
      title: 'AATest', page: Test(), codePreview: 'view/example/test.dart'),
];
List<TaskItem> apiCallItem = [
  TaskItem(title: 'Http Api Call', page: ApiHttpPage(), codePreview: 'view/api/api_http_page.dart'),
  TaskItem(title: 'Git Api Call', page: GitHttpsUsers(), codePreview: 'view/api/git_https_users.dart'),
  TaskItem(title: 'DIO Api Call', page: ApiDioPage(), codePreview: 'view/api/api_dio_page.dart'),
  TaskItem(title: 'DIO Architecture', page: ApiDioArchPage(), codePreview: 'view/api/api_dio_arch_page.dart'),
];
List<TaskItem> splashPageItem = [
  TaskItem(title: 'Splash Page1', page: SplashPage1(), codePreview: 'view/splash/splash_page1.dart'),
  TaskItem(title: 'Splash Page2', page: SplashPage2(), codePreview: 'view/splash/splash_page2.dart'),
  TaskItem(title: 'Splash Page3', page: SplashPage3(), codePreview: 'view/splash/splash_page3.dart'),
];
List<TaskItem> onboardingPageItem = [
  TaskItem(title: 'Onboarding Page1', page: OnboardingPage1(), codePreview: 'view/onboarding/onboarding_page1.dart'),
  TaskItem(title: 'Onboarding Page2', page: OnboardingPage2(), codePreview: 'view/onboarding/onboarding_page2.dart'),
  TaskItem(title: 'Onboarding Page3', page: OnboardingPage3(), codePreview: 'view/onboarding/onboarding_page3.dart'),
  TaskItem(title: 'Onboarding Page4', page: OnboardingPage4(), codePreview: 'view/onboarding/onboarding_page4.dart'),
  TaskItem(title: 'Onboarding Page5', page: OnboardingPage5(), codePreview: 'view/onboarding/onboarding_page5.dart'),
  TaskItem(title: 'Onboarding Page6', page: OnboardingPage6(), codePreview: 'view/onboarding/onboarding_page6.dart'),
  TaskItem(title: 'Onboarding Page7', page: OnboardingPage7(), codePreview: 'view/onboarding/onboarding_page7.dart'),
];
List<TaskItem> loginPageItem = [
  TaskItem(title: 'Login Page1', page: LoginPage1(), codePreview: 'view/login/login_page1.dart'),
  TaskItem(title: 'Login Page2', page: LoginPage2(), codePreview: 'view/login/login_page2.dart'),
  TaskItem(title: 'Login Page3', page: LoginPage3(), codePreview: 'view/login/login_page3.dart'),
  TaskItem(title: 'Login Page4', page: LoginPage4(), codePreview: 'view/login/login_page4.dart'),
  TaskItem(title: 'Login Page5', page: LoginPage5(), codePreview: 'view/login/login_page5.dart'),
  TaskItem(title: 'Login Page6', page: LoginPage6(), codePreview: 'view/login/login_page6.dart'),
  TaskItem(title: 'Login Page7', page: LoginPage7(), codePreview: 'view/login/login_page7.dart'),
  TaskItem(title: 'Login Welcome Page', page: LoginWelcomePage(), codePreview: 'view/login/login_welcome_page.dart'),
  TaskItem(title: 'Login Welcome Page2', page: LoginWelcomePage2(), codePreview: 'view/login/login_welcome_page2.dart'),
  TaskItem(title: 'Login Page8', page: LoginPage8(), codePreview: 'view/login/login_page8.dart'),
  TaskItem(title: 'Login Page9', page: LoginPage9(), codePreview: 'view/login/login_page9.dart'),
  TaskItem(title: 'Login Page10', page: LoginPage10(), codePreview: 'view/login/login_page10.dart'),
  TaskItem(title: 'Login Wave Page11', page: LoginWavePage11(), codePreview: 'view/login/login_wave_page11.dart'),
  TaskItem(title: 'Login Page12', page: LoginPage12(), codePreview: 'view/login/login_page12.dart'),
  TaskItem(title: 'Login Page13', page: LoginPage13(), codePreview: 'view/login/login_page13.dart'),
];
List<TaskItem> homeItem = [
  TaskItem(title: 'Home Page1', page: HomePage1(), codePreview: 'view/home/home_page1.dart'),
  TaskItem(title: 'Home Page2', page: HomePage2(), codePreview: 'view/home/home_page2.dart'),
  TaskItem(title: 'Home Page3', page: HomePage3(), codePreview: 'view/home/home_page3.dart'),
  TaskItem(title: 'Home Page4', page: HomePage4(), codePreview: 'view/home/home_page4.dart'),
  TaskItem(title: 'Home Page5', page: HomePage5(), codePreview: 'view/home/home_page5.dart'),
  TaskItem(title: 'Home Page6', page: HomePage6(), codePreview: 'view/home/home_page6.dart'),
];
List<TaskItem> detailsItem = [
  TaskItem(title: 'Detail Page1', page: DetailPage1(), codePreview: 'view/details/detail_page1.dart'),
  TaskItem(title: 'Detail Page2', page: DetailPage2(), codePreview: 'view/details/detail_page2.dart'),
  TaskItem(title: 'Detail Page3', page: DetailPage3(), codePreview: 'view/details/detail_page3.dart'),
  TaskItem(title: 'Detail Page4', page: DetailPage4(), codePreview: 'view/details/detail_page4.dart'),
  TaskItem(title: 'Detail Page5', page: DetailPage5(), codePreview: 'view/details/detail_page5.dart'),
  TaskItem(title: 'Detail Page6', page: DetailPage6(), codePreview: 'view/details/detail_page6.dart'),
  TaskItem(title: 'Detail Page7', page: DetailPage7(), codePreview: 'view/details/detail_page7.dart'),
];
List<TaskItem> profileItem = [
  TaskItem(title: 'Profile Page1', page: ProfilePage1(), codePreview: 'view/profile/profile_page1.dart'),
  TaskItem(title: 'Profile Page2', page: ProfilePage2(), codePreview: 'view/profile/profile_page2.dart'),
  TaskItem(title: 'Profile Page3', page: ProfilePage3(), codePreview: 'view/profile/profile_page3.dart'),
  TaskItem(title: 'Profile Page4', page: ProfilePage4(), codePreview: 'view/profile/profile_page4.dart'),
  TaskItem(title: 'Profile Page5', page: ProfilePage5(), codePreview: 'view/profile/profile_page5.dart'),
  TaskItem(title: 'Profile Page6', page: ProfilePage6(), codePreview: 'view/profile/profile_page6.dart'),
  TaskItem(title: 'Profile Page7', page: ProfilePage7(), codePreview: 'view/profile/profile_page7.dart'),
  TaskItem(title: 'Profile Page8', page: ProfilePage8(), codePreview: 'view/profile/profile_page8.dart'),
];
List<TaskItem> settingPageItem = [
  TaskItem(title: 'Setting Page1', page: SettingPage1(), codePreview: 'view/settings/setting_page1.dart'),
  TaskItem(title: 'Setting Page2', page: SettingPage2(), codePreview: 'view/settings/setting_page2.dart'),
  TaskItem(title: 'Setting Page3', page: SettingPage3(), codePreview: 'view/settings/setting_page3.dart'),
  TaskItem(title: 'Setting Page4', page: SettingPage4(), codePreview: 'view/settings/setting_page4.dart'),
];
List<TaskItem> tabBarPageItem = [
  TaskItem(title: 'Tab Page1', page: TabPage1(), codePreview: 'view/tabbar/tab_page1.dart'),
  TaskItem(title: 'Tab Page2', page: TabPage2(), codePreview: 'view/tabbar/tab_page2.dart'),
  TaskItem(title: 'Tab Page3', page: TabPage3(), codePreview: 'view/tabbar/tab_page3.dart'),
];
List<TaskItem> listPageItem = [
  TaskItem(title: 'List Page1', page: ListPage1(), codePreview: 'view/list/list_page1.dart'),
  TaskItem(title: 'List Page2', page: ListPage2(), codePreview: 'view/list/list_page2.dart'),
  TaskItem(title: 'List Cart Item Page 1', page: ListCartItemPage1(), codePreview: 'view/list/list_cart_item_page1.dart'),
  TaskItem(title: 'List Cart Item Page 2', page: ListCartItemPage2(), codePreview: 'view/list/list_cart_item_page2.dart'),
  TaskItem(title: 'List Cart Item Page 3', page: ListCartItemPage3(), codePreview: 'view/list/list_cart_item_page3.dart'),
];
List<TaskItem> bottomNavItem = [
  TaskItem(title: 'Bottom Nav Page1', page: BottomNavPage1(), codePreview: 'view/bottombar/bottom_nav_page1.dart'),
  TaskItem(title: 'Bottom Nav Page2', page: BottomNavPage2(), codePreview: 'view/bottombar/bottom_nav_page2.dart'),
  TaskItem(title: 'Bottom Nav Page3', page: BottomNavPage3(), codePreview: 'view/bottombar/bottom_nav_page3.dart'),
  TaskItem(title: 'Bottom Nav Page4', page: BottomNavPage4(), codePreview: 'view/bottombar/bottom_nav_page4.dart'),
  TaskItem(title: 'Bottom Nav Page5', page: BottomNavPage5(), codePreview: 'view/bottombar/bottom_nav_page5.dart'),
  TaskItem(title: 'Bottom Nav Page6', page: BottomNavPage6(), codePreview: 'view/bottombar/bottom_nav_page6.dart'),
  TaskItem(title: 'Bottom Nav Page7', page: BottomNavPage7(), codePreview: 'view/bottombar/bottom_nav_page7.dart'),
];
List<TaskItem> collapseToolbarItem = [
  TaskItem(title: 'Collapse toolbar1', page: CollapseToolbarPage1(), codePreview: 'view/collpasetoolbar/collapsetoolbar_page1.dart'),
  TaskItem(title: 'Collapse Arc Page2', page: CollapseArcPage2(), codePreview: 'view/collpasetoolbar/collapse_arc_page1.dart'),
  TaskItem(title: 'Collapse Zoom Img', page: CollapseZoomImgPage2(), codePreview: 'view/collpasetoolbar/collapse_zoom_img_page2.dart'),
  TaskItem(title: 'Collapse Page3', page: CollapsePage3(), codePreview: 'view/collpasetoolbar/collapse_page3.dart'),
  TaskItem(title: 'Collapse Fade Appbar', page: CollapseFadeAppBar(), codePreview: 'view/collpasetoolbar/collapse_fade_appbar.dart'),
  TaskItem(title: 'WaveAppbar', page: WaveAppbar(), codePreview: 'view/collpasetoolbar/wave_appbar.dart'),
  TaskItem(title: 'Collapse Zoom Out Fab', page: CollapseFabZoomOut(), codePreview: 'view/collpasetoolbar/collapse_fab_zoom_out.dart'),
  TaskItem(title: 'Collapse Page4', page: CollapsePage4(), codePreview: 'view/collpasetoolbar/collapse_page4.dart'),
];
List<TaskItem> navPageItem = [
  TaskItem(title: 'One side', page: NavDrawerScreen(), codePreview: 'view/navigation/nav_drawer.dart'),
  TaskItem(title: 'Both side', page: BothSideNavDrawerScreen(), codePreview: 'view/navigation/nav_drawer_bothside.dart'),
  TaskItem(title: 'Curve Navigation', page: NavDrawerCurvePage(), codePreview: 'view/navigation/nav_drawer_curve_page.dart'),
  TaskItem(title: 'Slide Navigation', page: NavDrawerSlidePage(), codePreview: 'view/navigation/nav_drawer_slide_page.dart'),
  TaskItem(title: 'Nav drawer same like fragment', page: NavLikeFragPage(), codePreview: 'view/navigation/nav_like_frag_page.dart'),
  TaskItem(title: 'Nav Behavior', page: NavBehaviorPage(), codePreview: 'view/navigation/nav_behavior_page.dart'),
  TaskItem(title: 'Back Drop Drawer', page: NavBackDropDrawer(), codePreview: 'view/navigation/nav_back_drop_drawer.dart'),
  TaskItem(title: 'Drop Down Drawer', page: NavigDropDown(), codePreview: 'view/navigation/nav_drop_down.dart'),
];
List<TaskItem> pullToRefreshItem = [
  TaskItem(title: 'Pull to refresh default', page: PullToRefresh(), codePreview: 'view/pulltorefresh/pull_to_refresh.dart'),
  TaskItem(title: 'Water drop material', page: WaterDropMaterial(), codePreview: 'view/pulltorefresh/water_drop_material.dart'),
  TaskItem(title: 'Water drop', page: WaterDrop(), codePreview: 'view/pulltorefresh/water_drop.dart'),
];
