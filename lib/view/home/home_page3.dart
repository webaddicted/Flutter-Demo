import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
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
      backgroundColor: ColorConst.greyBgColor,
      body: _createUi(),
    );
  }
  Widget _createUi() {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: ColorConst.blackColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Hello ${StringConst.DEEPAK_SHARMA},",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(
                          "Where do you want to go?",
                          style: TextStyle(color: Colors.grey.shade700),
                        )
                      ],
                    ),
                    loadCircleImg(ApiConstant.WEBADDICTED_IMG, 0, 40)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                child: const Material(
                  elevation: 5.0,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Find destination",
                        prefixIcon: Icon(Icons.location_on),
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
      margin: const EdgeInsets.only(top: 15),
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 10),
          Text("Index $index")
        ],
      ),
    );
  }

  Widget _buildActivities(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: _buildTitledContainer(
        "Activities",
        height: 240,
        child: Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics:  const ClampingScrollPhysics(),
            itemCount: activities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.3 / 1,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorConst.appColor,
                    child: activities[index].icon != null
                        ? Icon(
                            activities[index].icon,
                            size: 18.0,
                          )
                        : null,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    activities[index].title!,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Container _buildTitledContainer(String title, {Widget? child, double? height}) {
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
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
        title: "Video ",
        icon: FontAwesomeIcons.video),
    TaskItem(
        page: HomePage1(), title: "Summary", icon: FontAwesomeIcons.fileAlt),
    TaskItem(
        page: HomePage1(), title: "Billing", icon: FontAwesomeIcons.dollarSign),
  ];
}
