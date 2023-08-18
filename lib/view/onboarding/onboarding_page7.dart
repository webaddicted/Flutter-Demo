import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/sp/sp_manager.dart';
import 'package:flutterbeginner/view/alltask/all_task.dart';

class OnBoardingPage7 extends StatefulWidget {
  @override
  State<OnBoardingPage7> createState() => _OnBoardingPage7State();
}

class _OnBoardingPage7State extends State<OnBoardingPage7>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          SPManager.setOnboarding(true);
          navigationPushReplacement(context, AllTasks());
        },
        getStartedClicked: (value) {
          SPManager.setOnboarding(true);
          navigationPushReplacement(context, AllTasks());
        },
      ),
    );
  }

  final pages = [
    SkOnboardingModel(
        title: 'Set your own goals',
        description:
            'Goal support your motivation and inspire you to work harder',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: AssetsConst.SLIDER4_IMG),
    SkOnboardingModel(
        title: 'Track your progress',
        description:
            'Analyse personal result with detailed chart and numerical values',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: AssetsConst.SLIDER5_IMG),
    SkOnboardingModel(
        title: 'Create photo comparisons',
        description: 'Take before and after photos to visualize progress ',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: AssetsConst.SLIDER6_IMG),
  ];
}

class SKOnboardingScreen extends StatefulWidget {
  final List<SkOnboardingModel> pages;
  final Color bgColor;
  final Color themeColor;
  final ValueChanged<String> skipClicked;
  final ValueChanged<String> getStartedClicked;

  const SKOnboardingScreen({
    Key? key,
    required this.pages,
    required this.bgColor,
    required this.themeColor,
    required this.skipClicked,
    required this.getStartedClicked,
  }) : super(key: key);

  @override
  SKOnboardingScreenState createState() => SKOnboardingScreenState();
}

class SKOnboardingScreenState extends State<SKOnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> buildOnBoardingPages() {
    final children = <Widget>[];
    for (int i = 0; i < widget.pages.length; i++) {
      children.add(_showPageData(widget.pages[i]));
    }
    return children;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? widget.themeColor : const Color(0xFF929794),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: () {
                      widget.skipClicked("Skip Tapped");
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 500.0,
                  color: Colors.transparent,
                  child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: buildOnBoardingPages()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != widget.pages.length - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, bottom: 10),
                            child: FloatingActionButton(
                              backgroundColor: widget.bgColor,
                              child: Icon(
                                Icons.arrow_forward,
                                color: widget.themeColor,
                              ),
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == widget.pages.length - 1
          ? _showGetStartedButton()
          : const Text(''),
    );
  }

  Widget _showPageData(SkOnboardingModel page) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(page.imagePath),
              height: 300.0,
              width: 300.0,
            ),
          ),
          const SizedBox(height: 30.0),
          Text(
            page.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: page.titleColor,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            page.description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: page.descripColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _showGetStartedButton() {
    final GestureDetector loginButtonWithGesture = GestureDetector(
      onTap: _getStartedTapped,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            color: widget.themeColor,
            borderRadius: const BorderRadius.all(Radius.circular(6.0))),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );

    return Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 30.0),
        child: loginButtonWithGesture);
  }

  void _getStartedTapped() {
    widget.getStartedClicked("Get Started Tapped");
  }
}

class SkOnboardingModel {
  String title;
  String description;
  Color titleColor;
  Color descripColor;
  String imagePath;

  SkOnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.titleColor,
    required this.descripColor,
  });
}
