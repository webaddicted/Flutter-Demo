
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class DetailPage4 extends StatefulWidget {
  @override
  _DetailPage4State createState() => _DetailPage4State();
}

class _DetailPage4State extends State<DetailPage4> {
  @override
  Widget build(BuildContext context) {
    final String title = "Hot and Sour Soup";
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: ColorConst.greyBgColor,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        height: 400,
                        width: double.infinity,
                        child: Image.asset(
                          AssetsConst.bgFoodImg,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      left: 15.0,
                      bottom: 8.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                          getTxtWhiteColor(
                              msg: title,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10.0,
                      bottom: 0,
                      child: Chip(
                        elevation: 0,
                        labelStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        backgroundColor: Theme.of(context).primaryColor,
                        label: const Text("Rs. 1,800"),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: getTxtBlackColor(
                            msg: "Serving Size 1 Cup Contain : ",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            SpecsBlock(
                              label: "Carbs",
                              value: "15.2 g",
                              icon: Icon(
                                Icons.apps,
                              ),
                            ),
                            SpecsBlock(
                              label: "Protein",
                              value: "3.7 g",
                              icon: Icon(
                                Icons.apps,
                              ),
                            ),
                            SpecsBlock(
                              label: "Fat",
                              value: "8.1 g",
                              icon: Icon(
                                Icons.apps,
                              ),
                            ),
                            SpecsBlock(
                              label: "Cholesterol",
                              value: "0 mg",
                              icon: Icon(
                                Icons.apps,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: getTxtBlackColor(
                            msg: "Free Delivery",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 5.0),
                      const Padding(
                        padding: EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: Text(
                            "Morning 9:30AM - 11:00AM  Evening 8:00PM - 11:00PM"),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                        child: getTxtBlackColor(
                            msg: "Nutritional Info",
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      BorderedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: const Text("Dietary Fiber"),
                          trailing: getTxtBlackColor(
                              msg: "1 g",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      BorderedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: const Text("Iron"),
                          trailing: getTxtBlackColor(
                              msg: "15 %",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      BorderedContainer(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: const Text("Monounsaturated"),
                          trailing: getTxtBlackColor(
                              msg: "4g ",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      BorderedContainer(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          title: const Text("Polyunsaturated"),
                          trailing: getTxtBlackColor(
                              msg: "5.4 g",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      BorderedContainer(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          title: const Text("Potassium"),
                          trailing: getTxtBlackColor(
                              msg: "1.0 g",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      BorderedContainer(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                        ),
                        padding: const EdgeInsets.all(0),
                        child: ListTile(
                          title: const Text("Sodium"),
                          trailing: getTxtBlackColor(
                              msg: "250 gm",
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.message),
              label: const Text("Message Seller"),
              onPressed: () {},
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 10, top: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  heroTag: 'right',
                  child: const Icon(Icons.arrow_back_ios_sharp,
                      color: ColorConst.whiteColor),
                  backgroundColor: Colors.black26,
                  elevation: 0.5,
                ),
              ))
        ],
      ),
    );
  }
}

class BorderedContainer extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double elevation;

  const BorderedContainer({
    Key? key,
    this.title,
    this.child,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.width = double.infinity,
    this.elevation = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color,
      margin: margin ?? const EdgeInsets.all(0),
      child: Container(
        padding: padding ?? const EdgeInsets.all(16.0),
        width: width,
        height: height,
        child: title == null
            ? child
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title!,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                  ),
                  if (child != null) ...[const SizedBox(height: 10.0), child!]
                ],
              ),
      ),
    );
  }
}

class SpecsBlock extends StatelessWidget {
  const SpecsBlock({
    Key? key,
    this.icon,
    this.label,
    this.value,
  }) : super(key: key);

  final Widget? icon;
  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            icon!,
            const SizedBox(height: 2.0),
            Text(
              label!,
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              value!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
