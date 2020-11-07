import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/view/api/api_call_page.dart';
import 'package:flutterbeginner/view/api/api_dio_arch_page.dart';
import 'package:flutterbeginner/view/api/api_dio_page.dart';
import 'package:flutterbeginner/view/api/api_http_page.dart';
import 'package:flutterbeginner/view/api/git_https_users.dart';
import 'package:flutterbeginner/view/bottombar/bottom_nav_page.dart';
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
import 'package:flutterbeginner/view/collapsetoolbar/collapsetoolbar_page.dart';
import 'package:flutterbeginner/view/collapsetoolbar/collapsetoolbar_page1.dart';
import 'package:flutterbeginner/view/collapsetoolbar/wave_appbar.dart';
import 'package:flutterbeginner/view/details/detail_page1.dart';
import 'package:flutterbeginner/view/details/detail_page2.dart';
import 'package:flutterbeginner/view/details/detail_page3.dart';
import 'package:flutterbeginner/view/details/detail_page4.dart';
import 'package:flutterbeginner/view/details/details_page.dart';
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
import 'package:flutterbeginner/view/home/home_page.dart';
import 'package:flutterbeginner/view/home/home_page1.dart';
import 'package:flutterbeginner/view/home/home_page2.dart';
import 'package:flutterbeginner/view/home/home_page3.dart';
import 'package:flutterbeginner/view/list/list_cart_item_page1.dart';
import 'package:flutterbeginner/view/list/list_page.dart';
import 'package:flutterbeginner/view/list/list_page1.dart';
import 'package:flutterbeginner/view/list/list_page2.dart';
import 'package:flutterbeginner/view/local/audio/audio_screen.dart';
import 'package:flutterbeginner/view/local/call_log_screen.dart';
import 'package:flutterbeginner/view/local/contact/contact_screen.dart';
import 'package:flutterbeginner/view/local/document/document_screen.dart';
import 'package:flutterbeginner/view/local/image/image_screen.dart';
import 'package:flutterbeginner/view/local/sms_screen.dart';
import 'package:flutterbeginner/view/local/video/video_screen.dart';
import 'package:flutterbeginner/view/login/login_page.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';
import 'package:flutterbeginner/view/login/login_page10.dart';
import 'package:flutterbeginner/view/login/login_page12.dart';
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
import 'package:flutterbeginner/view/navigation/navigation_page.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page1.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page2.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page3.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page4.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page5.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page6.dart';
import 'package:flutterbeginner/view/onboarding/onboarding_page7.dart';
import 'package:flutterbeginner/view/profile/profile_page.dart';
import 'package:flutterbeginner/view/profile/profile_page1.dart';
import 'package:flutterbeginner/view/profile/profile_page2.dart';
import 'package:flutterbeginner/view/profile/profile_page3.dart';
import 'package:flutterbeginner/view/profile/profile_page4.dart';
import 'package:flutterbeginner/view/profile/profile_page5.dart';
import 'package:flutterbeginner/view/profile/profile_page6.dart';
import 'package:flutterbeginner/view/profile/profile_page7.dart';
import 'package:flutterbeginner/view/profile/profile_page8.dart';
import 'package:flutterbeginner/view/pulltorefresh/pull_to_refresh.dart';
import 'package:flutterbeginner/view/pulltorefresh/pull_to_refresh_page.dart';
import 'package:flutterbeginner/view/pulltorefresh/water_drop.dart';
import 'package:flutterbeginner/view/pulltorefresh/water_drop_material.dart';
import 'package:flutterbeginner/view/settings/setting_page.dart';
import 'package:flutterbeginner/view/settings/setting_page1.dart';
import 'package:flutterbeginner/view/settings/setting_page2.dart';
import 'package:flutterbeginner/view/splash/splash_page.dart';
import 'package:flutterbeginner/view/splash/splash_page1.dart';
import 'package:flutterbeginner/view/splash/splash_page2.dart';
import 'package:flutterbeginner/view/splash/splash_page3.dart';
import 'package:flutterbeginner/view/tabbar/tab_page1.dart';
import 'package:flutterbeginner/view/tabbar/tab_page2.dart';
import 'package:flutterbeginner/view/tabbar/tabbar_page.dart';
import 'package:flutterbeginner/view/test.dart';
import 'package:flutterbeginner/view/widgets/button_widget.dart';
import 'package:flutterbeginner/view/widgets/image_widget.dart';
import 'package:flutterbeginner/view/widgets/misc_widget.dart';
import 'package:flutterbeginner/view/widgets/progress_bar_widget.dart';
import 'package:flutterbeginner/view/widgets/text_field_widget.dart';
import 'package:flutterbeginner/view/widgets/text_widget.dart';

List<String> dummyImgList = [
  'https://wallpapercave.com/wp/wp2519534.jpg',
  'https://pluspng.com/img-png/vodafone-zoo-zoo-png-zoo-zoo-zoo-zoo-zoo-zoo-660.jpg',
  'https://webneel.com/daily/sites/default/files/images/daily/05-2013/zoozoo-vodafone-wallpaper-10.jpg',
  'https://webneel.com/daily/sites/default/files/images/daily/05-2013/zoozoo-vodafone-wallpaper-4.jpg',
  'https://i.pinimg.com/originals/e5/22/11/e52211d7ed30172145da8ec17574d8e7.jpg',
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
List<TaskItem> taskItem = [
  TaskItem(title: 'Text', page: TextWidget()),
  TaskItem(title: 'Text Field', page: TextFieldWidget()),
  TaskItem(title: 'Image View', page: ImageWidget()),
  TaskItem(title: 'Button', page: ButtonWidget()),
  TaskItem(title: 'Progress Bar', page: ProgressBarWidget()),
  TaskItem(title: 'Misc Widget', page: MiscWidget()),
  TaskItem(title: 'Login UI Design', page: LoginPage()),
  TaskItem(title: 'Read local file JSON', page: LocalData()),
  TaskItem(title: 'Chat app screen', page: ChatScreen()),
  TaskItem(title: 'Calculator', page: CalculatorApp()),
  TaskItem(title: 'Pagination', page: Pagination()),
  TaskItem(title: 'API Call', page: ApiCallPage()),
  TaskItem(title: 'Navigation drawer UI', page: NavigationPage()),
  TaskItem(title: 'Stepper', page: StepperView()),
  TaskItem(title: 'Bottom Navigation', page: BottomNavPage()),
  TaskItem(title: 'Tab Bar', page: TabBarPage()),
  TaskItem(title: 'Shared preference', page: SPScreen()),
  TaskItem(title: 'OnBoarding UI', page: OnboardingPage()),
  TaskItem(title: 'Splash', page: SplashPage()),
  TaskItem(title: 'Run time permission', page: PermissionHelper()),
  TaskItem(title: 'Swipe to delete', page: SwipeToDelete()),
  TaskItem(title: 'Firebase', page: FcmSocialLogin()),
  TaskItem(title: 'Bottom Sheet', page: BottomSheetScreen()),
  TaskItem(title: 'Dragable Bottom Sheet', page: BottomSheetDragableScreen()),
  TaskItem(title: 'Image Picker', page: CameraGallery()),
  TaskItem(title: 'Dialog', page: DialogScreen()),
  TaskItem(title: 'Google map', page: GoogleMapScreen()),
  TaskItem(title: 'Pull To Refresh', page: PullToRefreshPage()),
  TaskItem(title: 'Signature', page: SignatureScreen()),
  TaskItem(title: 'Collapse Toolbar', page: CollapseToolbarPage()),
  TaskItem(title: 'WebView', page: WebViewScreen()),
  TaskItem(title: 'Barcode Scanner', page: BarcodeScannerScreen()),
  TaskItem(
      title: 'Video Player',
      page: VideoPlayerScreen(ApiConstant.VIDEO_URL, null)),
  TaskItem(title: 'Download File', page: DownloadFileScreen()),
  TaskItem(title: 'All Contacts', page: ContactScreen()),
  TaskItem(title: 'All SMS', page: SmsScreen()),
  TaskItem(title: 'All Images', page: ImageScreen()),
  TaskItem(title: 'All Videos', page: VideoScreen()),
  TaskItem(title: 'All Audio', page: AudioScreen()),
  TaskItem(title: 'All Documents', page: DocumentScreen()),
  TaskItem(title: 'All Call Log', page: CallLogScreen()),
  TaskItem(title: 'Grid View', page: GridViewScreen()),
  TaskItem(title: 'Share Data', page: ShareDataScreen()),
  TaskItem(title: 'Finger Print', page: FingerPrintScreen()),
  TaskItem(title: 'Device Info', page: DeviceInfoScreen()),
  TaskItem(title: 'List Ui', page: ListPage()),
  TaskItem(title: 'Screenshot', page: ScreenshotPage()),
  TaskItem(title: 'Blend Mode (Image Filter)', page: BlendModePage()),
  TaskItem(title: 'ReOreder List', page: ReorderPage()),
  TaskItem(title: 'View Pager', page: PageViewScreen()),
  TaskItem(title: 'Staggered Grid view', page: StaggeredGridScreen()),
  TaskItem(title: 'Profile UI Design', page: ProfilePage()),
  TaskItem(title: 'Details UI Design', page: DetailsPage()),
  TaskItem(title: 'Setting UI Design', page: SettingsPage()),
  TaskItem(title: 'Home UI Design', page: HomePageDesign()),
  TaskItem(title: 'Blur effect', page: BlurEffectPage()),
  TaskItem(title: 'Animation', page: AnimationPage()),
  TaskItem(title: 'ZZZZ', page: StaggeredGridScreen()),
  TaskItem(title: 'AATest', page: Test()),
];

List<TaskItem> apiCallItem = [
  TaskItem(title: 'Http Api Call', page: ApiHttpPage()),
  TaskItem(title: 'Git Api Call', page: GitUsers()),
  TaskItem(title: 'DIO Api Call', page: ApiDioPage()),
  TaskItem(title: 'DIO Architecture', page: ApiDioArchPage()),
];

List<TaskItem> bottomNavItem = [
  TaskItem(title: 'Bottom Nav Page1', page: BottomNavPage1()),
  TaskItem(title: 'Bottom Nav Page2', page: BottomNavPage2()),
  TaskItem(title: 'Bottom Nav Page3', page: BottomNavPage3()),
  TaskItem(title: 'Bottom Nav Page4', page: BottomNavPage4()),
  TaskItem(title: 'Bottom Nav Page5', page: BottomNavPage5()),
  TaskItem(title: 'Bottom Nav Page6', page: BottomNavPage6()),
  TaskItem(title: 'Bottom Nav Page7', page: BottomNavPage7()),
];
List<TaskItem> collapseToolbarItem = [
  TaskItem(title: 'Collapse toolbar1', page: CollapseToolbarPage1()),
  TaskItem(title: 'Collapse Arc Page2', page: CollapseArcPage2()),
  TaskItem(title: 'Collapse Zoom Img', page: CollapseZoomImg3()),
  TaskItem(title: 'Collapse Page3', page: CollapsePage3()),
  TaskItem(title: 'Collapse Fade Appbar', page: CollapseFadeAppBar()),
  TaskItem(title: 'WaveAppbar', page: WaveAppbar()),
  TaskItem(title: 'Collapse Zoom Out Fab', page: CollapseFabZoomOut()),
  TaskItem(title: 'Collapse Page4', page: CollapsePage4()),
];
List<TaskItem> detailsItem = [
  TaskItem(title: 'Detail Page1', page: DetailPage1()),
  TaskItem(title: 'Detail Page2', page: DetailPage2()),
  TaskItem(title: 'Detail Page3', page: DetailPage3()),
  TaskItem(title: 'Detail Page4', page: DetailPage4()),
];
List<TaskItem> homeItem = [
  TaskItem(title: 'Home Page1', page: HomePage1()),
  TaskItem(title: 'Home Page2', page: HomePage2()),
  TaskItem(title: 'Home Page3', page: HomePage3()),
];
List<TaskItem> listPageItem = [
  TaskItem(title: 'List Page1', page: ListPage1()),
  TaskItem(title: 'List Page2', page: ListPage2()),
  TaskItem(title: 'List Cart Item Page 1', page: ListCartItemPage1()),
];
List<TaskItem> loginPageItem = [
  TaskItem(title: 'Login Page1', page: LoginPage1()),
  TaskItem(title: 'Login Page2', page: LoginPage2()),
  TaskItem(title: 'Login Page3', page: LoginPage3()),
  TaskItem(title: 'Login Page4', page: LoginPage4()),
  TaskItem(title: 'Login Page5', page: LoginPage5()),
  TaskItem(title: 'Login Page6', page: LoginPage6()),
  TaskItem(title: 'Login Page7', page: LoginPage7()),
  TaskItem(title: 'Login Welcome Page', page: LoginWelcomePage()),
  TaskItem(title: 'Login Welcome Page2', page: LoginWelcomePage2()),
  TaskItem(title: 'Login Page8', page: LoginPage8()),
  TaskItem(title: 'Login Page9', page: LoginPage9()),
  TaskItem(title: 'Login Page10', page: LoginPage10()),
  TaskItem(title: 'Login Wave Page11', page: LoginWavePage11()),
  TaskItem(title: 'Login Page12', page: LoginPage12()),
];
List<TaskItem> navPageItem = [
  TaskItem(title: 'One side', page: NavDrawerScreen()),
  TaskItem(title: 'Both side', page: BothSideNavDrawerScreen()),
  TaskItem(title: 'Curve Navigation', page: NavDrawerCurvePage()),
  TaskItem(title: 'Slide Navigation', page: NavDrawerSlidePage()),
  TaskItem(title: 'Nav drawer same like fragment', page: NavLikeFragPage()),
  TaskItem(title: 'Nav Behavior', page: NavBehaviorPage()),
  TaskItem(title: 'Back Drop Drawer', page: NavBackDropDrawer()),
  TaskItem(title: 'Drop Down Drawer', page: NavigDropDown()),
];
List<TaskItem> onboardingPageItem = [
  TaskItem(title: 'Onboarding Page1', page: OnboardingPage1()),
  TaskItem(title: 'Onboarding Page2', page: OnboardingPage2()),
  TaskItem(title: 'Onboarding Page3', page: OnboardingPage3()),
  TaskItem(title: 'Onboarding Page4', page: OnboardingPage4()),
  TaskItem(title: 'Onboarding Page5', page: OnboardingPage5()),
  TaskItem(title: 'Onboarding Page6', page: OnboardingPage6()),
  TaskItem(title: 'Onboarding Page7', page: OnboardingPage7()),
];
List<TaskItem> profileItem = [
  TaskItem(title: 'Profile Page1', page: ProfilePage1()),
  TaskItem(title: 'Profile Page2', page: ProfilePage2()),
  TaskItem(title: 'Profile Page3', page: ProfilePage3()),
  TaskItem(title: 'Profile Page4', page: ProfilePage4()),
  TaskItem(title: 'Profile Page5', page: ProfilePage5()),
  TaskItem(title: 'Profile Page6', page: ProfilePage6()),
  TaskItem(title: 'Profile Page7', page: ProfilePage7()),
  TaskItem(title: 'Profile Page8', page: ProfilePage8()),
];
List<TaskItem> pullToRefreshItem = [
  TaskItem(title: 'Pull to refresh default', page: PullToRefresh()),
  TaskItem(title: 'Water drop material', page: WaterDropMaterial()),
  TaskItem(title: 'Water drop', page: WaterDrop()),
];
List<TaskItem> settingPageItem = [
  TaskItem(title: 'Setting Page1', page: SettingPage1()),
  TaskItem(title: 'Setting Page2', page: SettingPage2()),
];
List<TaskItem> splashPageItem = [
  TaskItem(title: 'Splash Page1', page: SplashPage1()),
  TaskItem(title: 'Splash Page2', page: SplashPage2()),
  TaskItem(title: 'Splash Page3', page: SplashPage3()),
];
List<TaskItem> tabBarPageItem = [
  TaskItem(title: 'Tab Page1', page: TabPage1()),
  TaskItem(title: 'Tab Page2', page: TabPage2()),
];
