import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/utils/global_utility.dart';

class OnboardingPage6 extends StatefulWidget {
  @override
  State<OnboardingPage6> createState() => _OnboardingPage6State();
}

class _OnboardingPage6State extends State<OnboardingPage6> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              _currentPage = page;
              setState(() {});
            },
            children: <Widget>[
              _buildPageContent(
                  isShowImageOnTop: false,
                  image: AssetsConst.SLIDER4_IMG,
                  body: 'Description.',
                  color: const Color.fromRGBO(137, 168, 73, 1)),
              _buildPageContent(
                  isShowImageOnTop: true,
                  image: AssetsConst.SLIDER5_IMG,
                  body: 'Description ',
                  color: const Color.fromRGBO(255, 212, 0, 1)),
              _buildPageContent(
                  isShowImageOnTop: false,
                  image: AssetsConst.SLIDER6_IMG,
                  body: 'Description',
                  color: const Color.fromRGBO(137, 168, 73, 1))
            ],
          ),
          Positioned(
              bottom: 40,
              left: MediaQuery.of(context).size.width * .05,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * .9,
                  child: Row(
                    children: [
                      Row(children: [
                        for (int i = 0; i < _totalPages; i++)
                          i == _currentPage
                              ? _buildPageIndicator(true)
                              : _buildPageIndicator(false)
                      ]),
                      const Spacer(),
                      if (_currentPage != 2)
                        InkWell(
                          onTap: () {
                            _pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.linear);
                            setState(() {});
                          },
                          child: Container(
                            height: 70,
                            alignment: Alignment.center,
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      if (_currentPage == 2)
                        InkWell(
                          onTap: () => printLog(msg: 'Get Started Now'),
                          child: Container(
                            height: 70,
                            alignment: Alignment.center,
                            child: const Text(
                              'Start',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ]))
        ],
      ),
    );
  }

  Widget _buildPageContent(
      {String image = "", String body = "", Color color = Colors.deepOrange, isShowImageOnTop}) {
    return Container(
      decoration: BoxDecoration(color: color),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isShowImageOnTop)
            Column(
              children: [
                Center(
                  child: Image.asset(
                    image,
                    height: 300,
                    width: 300,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            ),
          if (isShowImageOnTop)
            Column(
              children: [
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    image,
                    height: 300,
                    width: 300,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 18.0 : 10.0,
      width: isCurrentPage ? 18.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.white54,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
