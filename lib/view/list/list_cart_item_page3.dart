import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class ListCartItemPage3 extends StatefulWidget {
  @override
  _ListCartItemPage3State createState() => _ListCartItemPage3State();
}

class _ListCartItemPage3State extends State<ListCartItemPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWithBackBtn(
          ctx: context, title: 'Your Cart', bgColor: Colors.green),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                GroceryListItemThree(
                  image: dummyLargeFoodImg[5],
                  subtitle: "4 in a pack",
                  title: "Pineapple",
                ),
                GroceryListItemThree(
                  image: dummyLargeFoodImg[8],
                  subtitle: "1 kg",
                  title: "cabbage",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildTotals()
        ],
      )),
    );
  }

  Widget _buildTotals() {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0,
                color: Colors.grey.shade700,
                spreadRadius: 80.0),
          ],
          color: Colors.white,
        ),
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Subtotal"),
                Text("Rs. 1500"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Delivery fee"),
                Text("Rs. 100"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total"),
                Text("Rs. 1600"),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Continue to Checkout",
                      style: TextStyle(color: Colors.white)),
                  Text("Rs. 1600", style: TextStyle(color: Colors.white)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OvalTopBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 40);
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, 0);
    path.quadraticBezierTo(size.width - size.width / 4, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class GroceryListItemThree extends StatelessWidget {
  const GroceryListItemThree({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.image,
    this.price,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10.0),
          Container(height: 80.0, child: loadCircleImg(image, 0,80)),
          const SizedBox(width: 10.0),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  getTxtBlackColor(
                      msg: title, fontSize: 17, fontWeight: FontWeight.bold),
                  getTxtBlackColor(
                      msg: subtitle, fontSize: 17, fontWeight: FontWeight.bold)
                ],
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.green,
                onPressed: () {},
              ),
              Text(
                "1",
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  Icons.remove_circle,
                ),
                color: Colors.green,
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
