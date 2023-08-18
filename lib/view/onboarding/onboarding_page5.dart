import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/customview/slide_dots.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class OnboardingPage5 extends StatefulWidget {
  @override
  State<OnboardingPage5> createState() => _OnboardingPage5State();
}

class _OnboardingPage5State extends State<OnboardingPage5> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: SliderLayout());

  bool inFinalPage() {
    if (_currentPage == sliderArrayList.length - 1) {
      return true;
    }
    return false;
  }

  Widget SliderLayout() => Stack(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.17),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: sliderArrayList.length,
          itemBuilder: (ctx, i) => SlideItemTest(i),
        ),
      ),
      Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 25.0,
                  top: MediaQuery.of(context).size.width * 0.12),
              child: getTxtBlackColor(
                msg: inFinalPage() ? "" : 'SKIP',
                fontWeight: FontWeight.w700,
                fontSize: 13.0,
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.only(
                bottom: 0.0,
                top: MediaQuery.of(context).size.height * 0.28),
            child: inFinalPage()
                ? GetStartedButton()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < sliderArrayList.length; i++)
                        if (i == _currentPage)
                          SlideDots(true)
                        else
                          SlideDots(false)
                    ],
                  ),
          ),
        ],
      )
    ],
  );
}

class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 45.0,
      width: 140.0,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.0),
        ),
        onPressed: () {
          //? do something
        },
        color: const Color(0xff01dc9d),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: getTxtWhiteColor(
            msg: "GET STARTED",
            fontWeight: FontWeight.w700,
            fontSize: 13.0,
          ),
        )),
      ),
    );
  }
}

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  final String? skipBtn;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading,
      this.skipBtn});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: AssetsConst.SLIDER4_IMG,
      sliderHeading: 'FIND RESTAURANT',
      sliderSubHeading: StringConst.DUMMY_TEXT,
      skipBtn: 'SKIP'),
  Slider(
      sliderImageUrl: AssetsConst.SLIDER5_IMG,
      sliderHeading: 'PICK THE BEST',
      sliderSubHeading: StringConst.DUMMY_TEXT,
      skipBtn: 'SKIP'),
  Slider(
      sliderImageUrl: AssetsConst.SLIDER6_IMG,
      sliderHeading: 'CHOOSE YOUR MEAL',
      sliderSubHeading: StringConst.DUMMY_TEXT,
      skipBtn: ""),
];

class SlideItemTest extends StatelessWidget {
  final int index;

  SlideItemTest(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        getTxtColor(
          msg: sliderArrayList[index].sliderHeading,
          fontWeight: FontWeight.w600,
          txtColor: const Color(0xff01dc9d),
          fontSize: 18.0,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: getTxtBlackColor(
              msg: sliderArrayList[index].sliderSubHeading,
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.14),
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage(sliderArrayList[index].sliderImageUrl))),
            ),
          ),
        )
      ],
    );
  }
}
