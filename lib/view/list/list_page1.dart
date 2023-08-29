import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/list_widget.dart';

class ListPage1 extends StatefulWidget {
  @override
  _ListPage1State createState() => _ListPage1State();
}

class _ListPage1State extends State<ListPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(ctx: context, title: StringConst.HOME_TITLE),
      body: _createUi(),
    );
  }

  Widget _createUi() {
    return SafeArea(
      child: Container(
        color: ColorConst.greyBgColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 18, bottom: 8),
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 35,
                    itemBuilder: (BuildContext context, int index) {
                      return OnlinePersonAction(
                        personImagePath: ApiConstant.WEBADDICTED_IMG,
                        actColor: ((index % 3 == 0)
                            ? Colors.greenAccent
                            : (index % 2 == 0)
                                ? Colors.yellowAccent
                                : Colors.red),
                      );
                    },
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: dummyImgList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListWidget(
                    onTap: onClick, thirdTitle: '',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  onClick(String image) {
    showImageDialog(context:context,imageFile:  image);
  }
}

class OnlinePersonAction extends StatelessWidget {
  final String personImagePath;
  final Color actColor;

  const OnlinePersonAction({
    Key? key,
    required this.personImagePath,
    required this.actColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            padding: const EdgeInsets.all(3.4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                width: 2.0,
                color: const Color(0xFF558AED),
              ),
            ),
            child: Container(
              width: 54.0,
              height: 54.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                    image: NetworkImage(personImagePath), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: actColor,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
