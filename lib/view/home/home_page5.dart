import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class HomePage5 extends StatefulWidget {
  @override
  _HomePage5State createState() => _HomePage5State();
}

class _HomePage5State extends State<HomePage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.GREY_BG_COLOR,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 180.0,
            backgroundColor: Color(0xfffb53c6),
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: ColorConst.WHITE_COLOR,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
            floating: true,
            flexibleSpace: ListView(
              children: <Widget>[
                SizedBox(height: 50.0),
                Text("Type your Food",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      // controller: TextEditingController(text: locations[0]),
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          hintText: "Search Food",
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 16),
                          prefixIcon: Material(
                            elevation: 0.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          SliverToBoxAdapter(
            child: _buildCategories(),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return _buildRooms(context, index);
            }, childCount: dummyLargeFoodData.length),
          )
        ],
      ),
    );
  }

  Widget _buildRooms(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      FadeInImage.assetNetwork(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: AssetsConst.LOGO_IMG,
                          image: dummyLargeFoodData[index]),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(
                          Icons.star,
                          color: Colors.grey.shade800,
                          size: 20.0,
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Icon(
                          Icons.star_border,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                      Positioned(
                        bottom: 20.0,
                        right: 10.0,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          color: Colors.white,
                          child: Text("\$40"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getTxtBlackColor(
                          msg: 'Paneer Makhani Biryani',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      SizedBox(height: 2.0),
                      getTxtBlackColor(msg: "Dish for lunch or dinner"),
                      SizedBox(height: 2.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "(220 reviews)",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 15.0,
          ),
          Category(
            backgroundColor: Colors.pink,
            icon: Icons.local_drink_sharp,
            title: "Costa",
          ),
          SizedBox(
            width: 15.0,
          ),
          Category(
            backgroundColor: Colors.blue,
            title: "Restaurant",
            icon: Icons.restaurant,
          ),
          SizedBox(
            width: 15.0,
          ),
          Category(
            icon: Icons.local_cafe,
            backgroundColor: Colors.orange,
            title: "Cafe",
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  const Category(
      {Key key,
      @required this.icon,
      @required this.title,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(title, style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
