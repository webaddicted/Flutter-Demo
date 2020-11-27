import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/game_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage8 extends StatefulWidget {
  @override
  _HomePage8State createState() => _HomePage8State();
}

class _HomePage8State extends State<HomePage8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      // getTxtBlackColor(msg: 'Welcome', fontSize: 25, fontWeight: Fon),
                      getTxtBlackColor(
                        msg: 'Welcome\n'+StringConst.APP_NAME,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,

                      ),
                    ],
                  ),
                  loadLocalCircleImg(AssetsConst.DEEPAK_IMG, 80)
                ],
              ),
              PreferredSize(
                child: Container(
                  child: Card(
                    elevation: 8,
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            icon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)),
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.mic))),
                      ),
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(80.0),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2.5 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (ctx, idx) => CategoryItem(
                      index: idx,
                    ),
                    itemCount: categories.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final int index;

  CategoryItem({this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 4, top: 8),
        decoration: BoxDecoration(
          color: categories[index].bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    categories[index].title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: new LinearGradient(
                      colors: [
                        Colors.black12,
                        categories[index].bgColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () => () {},
                  ),
                ),
              ],
            ),
            Expanded(
              child: Hero(
                tag: categories[index].title + index.toString(),
                child: Icon(
                  categories[index].icon,
                  color: ColorConst.WHITE_COLOR,
                  // fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
