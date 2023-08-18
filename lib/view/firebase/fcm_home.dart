import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/random_widget.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/fcm_home_bean.dart';
import 'package:flutterbeginner/view/local/image/full_image.dart';

class FcmHome extends StatefulWidget {
  @override
  _FcmHomeState createState() => _FcmHomeState();
}

class _FcmHomeState extends State<FcmHome> {
  List<FcmHomeBean> fcmCatBean = [];
  // var _fcmDb = FirebaseDatabase.instance.reference();
  late BuildContext _ctx;

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context,
          title: StringConst.HOME_TITLE,
          bgColor: ColorConst.FCM_APP_COLOR),
      body: Builder(builder: (_context) => _createUi(_context)),
    );
  }

  Widget _createUi(BuildContext context) {
    _ctx = context;
    return Container(
      child: Stack(
        children: <Widget>[bgDesign(), showView()],
      ),
    );
  }

  void getCategory() async {
    // _fcmDb.child('Category').once().then((DataSnapshot snapshot) {
    //   print('object  :  ' + snapshot.value.toString());
    //   Map<dynamic, dynamic> values = snapshot.value;
    //   values.forEach((key, values) {
    //     fcmCatBean.add(FcmHomeBean.map(values));
    //   });
    //   setState(() {});
    // }).catchError((onError) {
    //   print('object   :   ' + onError);
    // });
  }

  showView() {
    if (fcmCatBean.length == 0) {
      return _buildProgressIndicator();
    } else {
      return GridView.builder(
        itemCount: fcmCatBean.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5 / 1.8,
        ),
        itemBuilder: (BuildContext context, int index) =>
            fmHomeRow(fcmCatBean[index], index),
      );
    }
  }

  Widget _buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget fmHomeRow(FcmHomeBean fcmCatBean, int index) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            if (fcmCatBean.image != null) {
              navigationPush(context, FullImage(fcmCatBean.image, null,fcmCatBean.image));
            }
          },
          child: Hero(tag:fcmCatBean.image!,child: loadCircleImg(fcmCatBean.image!, 0, index % 2 == 0 ? 180 : 130)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getTxtBlackColor(
              msg: fcmCatBean.name!,textAlign:TextAlign.center, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
