import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabPage3 extends StatefulWidget {
  @override
  _TabPage3State createState() => _TabPage3State();
}

class _TabPage3State extends State<TabPage3> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        backgroundColor: Theme.of(context).buttonColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Categories'),
          leading: Icon(Icons.category),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: ColorConst.WHITE_COLOR,
            indicatorColor: ColorConst.WHITE_COLOR,
            unselectedLabelColor: ColorConst.BLACK_COLOR,
            tabs: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("For You"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Design"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Beauty"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Education"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Entertainment"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: dummyLargeData.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(index);
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
            ),
            Container(
              color: Colors.green,
              child: Center(
                  child: getTxtWhiteColor(
                      msg: "Tab 2", fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              color: Colors.purpleAccent,
              child: Center(
                  child: getTxtWhiteColor(
                      msg: "Tab 3", fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              color: Colors.red,
              child: Center(
                  child: getTxtWhiteColor(
                      msg: "Tab 4", fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              color: Colors.yellowAccent,
              child: Center(
                  child: getTxtWhiteColor(
                      msg: "Tab 5", fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.folderOpen), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleItem(int index) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            color: ColorConst.APP_COLOR,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Container(
                    height: 100,
                    color: Colors.blue,
                    width: 80.0,
                    child: loadImg(dummyLargeData[index], 0)),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getTxtBlackColor(
                          msg: StringConst.DUMMY_TEXT,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          maxLines: 3),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: CircleAvatar(
                                radius: 15.0,
                                backgroundColor: ColorConst.FCM_APP_COLOR,
                              ),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 5.0),
                            ),
                            TextSpan(
                                text: StringConst.DEEPAK_SHARMA,
                                style: TextStyle(fontSize: 16.0)),
                            WidgetSpan(
                              child: const SizedBox(width: 20.0),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 5.0),
                            ),
                            TextSpan(
                              text: '2 min ago',
                            ),
                          ],
                        ),
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
