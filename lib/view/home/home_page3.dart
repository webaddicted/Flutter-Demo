import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/bean/task_item.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/home/home_page1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage3 extends StatefulWidget {
  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context,
          title: StringConst.HOME_TITLE,
          actions: [buildAvatar(context)]),
      body: _createUi(),
    );
  }

  Widget buildAvatar(BuildContext context) {
    return IconButton(
      iconSize: 40,
      padding: EdgeInsets.all(0),
      icon: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: loadLocalCircleImg(AssetsConst.DEEPAK_IMG, 30),
      ),
      onPressed: () {},
    );
  }

  Widget _createUi() {
    return SafeArea(
      child: Container(
        color: ColorConst.GREY_BG_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              getUsers(),
              _buildActivities(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getUsers() {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(top: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyImgList.length,
        itemBuilder: (BuildContext context, int index) {
          return _categoryList(context, index);
        },
      ),
    );
  }

  Widget _categoryList(BuildContext context, int index) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image: DecorationImage(
                    image: NetworkImage(dummyImgList[index]),
                    fit: BoxFit.cover)),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 100,
          ),
          SizedBox(height: 10),
          Text("Index $index")
        ],
      ),
    );
  }

  Widget _buildActivities(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: _buildTitledContainer(
        "Activities",
        height: 250,
        child: Expanded(
          child: GridView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: activities.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.2 / 0.8,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).buttonColor,
                    child: activities[index].icon != null
                        ? Icon(
                            activities[index].icon,
                            size: 18.0,
                          )
                        : null,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    activities[index].title,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Container _buildTitledContainer(String title, {Widget child, double height}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
          if (child != null) ...[const SizedBox(height: 10.0), child]
        ],
      ),
    );
  }

  final List<TaskItem> activities = [
    TaskItem(
        page: HomePage1(), title: "Results", icon: FontAwesomeIcons.listOl),
    TaskItem(page: HomePage1(), title: "Messages", icon: FontAwesomeIcons.sms),
    TaskItem(
        page: HomePage1(),
        title: "Appointments",
        icon: FontAwesomeIcons.calendarDay),
    TaskItem(
        page: HomePage1(),
        title: "Video Consultation",
        icon: FontAwesomeIcons.video),
    TaskItem(
        page: HomePage1(), title: "Summary", icon: FontAwesomeIcons.fileAlt),
    TaskItem(
        page: HomePage1(), title: "Billing", icon: FontAwesomeIcons.dollarSign),
  ];
}
