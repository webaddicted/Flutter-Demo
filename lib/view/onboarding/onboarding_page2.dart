import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/login/login_page1.dart';

class OnboardingPage2 extends StatefulWidget {
  @override
  _OnboardingPage2State createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 3;

  List<Widget> _buildPageIndicators() {
    List<Widget> widgets = [];
    for (int i = 0; i < _numPages; i++) {
      widgets
          .add(i == _currentPage ? TestIndicator(true) : TestIndicator(false));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          decoration: BoxDecoration(
            gradient: kLinearGradient,
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: AnimatedOpacity(
                      opacity: _currentPage == 0 ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 200),
                      child: getTxtWhiteColor(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        msg: 'Skip',
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 100),
                    Expanded(
                      child: Stack(
                        children: [
                          PageView(
                            physics: ClampingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            children: <Widget>[
                              OnBoardingTest0(
                                  Icons.add,
                                  'Connect People\naround the world',
                                  StringConst.DUMMY_TEXT),
                              OnBoardingTest0(
                                  Icons.add,
                                  'Live your life smarter\nwith us!',
                                  StringConst.DUMMY_TEXT),
                              OnBoardingTest0(
                                  Icons.add,
                                  'Get a new experience\nof imagination',
                                  StringConst.DUMMY_TEXT),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                  SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicators(),
                    ),
                  ],
                ),
             Align(
                    alignment: Alignment.bottomRight,
                    child: AnimatedOpacity(
                      opacity: _currentPage != _numPages - 1 ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: MaterialButton(
                        onPressed: _currentPage != _numPages - 1
                            ? () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }
                            : null,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            getTxtWhiteColor(
                                msg: 'Next',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.arrow_forward,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ])),
        ),
      // ),
      bottomSheet: _currentPage == _numPages - 1
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage1(),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                height: 50.0,
                width: double.infinity,
                child: Center(
                  child: getTxtBlackColor(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    msg: 'Get Started',
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

class OnBoardingTest0 extends StatelessWidget {
  IconData add;
  String title;
  String desc;

  OnBoardingTest0(this.add, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            loadCircleImg(ApiConstant.DEMO_IMG, 0, 150),
            SizedBox(height: 30.0),
            getTxtWhiteColor(
                textAlign: TextAlign.center,
                msg: title,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            SizedBox(height: 15.0),
            getTxtWhiteColor(
                msg: desc, fontSize: 18, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class TestIndicator extends StatelessWidget {
  final bool isActive;

  TestIndicator(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}

final Gradient kLinearGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.1, 0.4, 0.7, 0.9],
  colors: [
    Color(0xFF3594DD),
    Color(0xFF4563DB),
    Color(0xFF5036D5),
    Color(0xFF5B16D0),
  ],
);
