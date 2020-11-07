import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/assets_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class ListCartItemPage2 extends StatefulWidget {
  @override
  _ListCartItemPage2State createState() => _ListCartItemPage2State();
}

class _ListCartItemPage2State extends State<ListCartItemPage2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal:16.0, vertical: 30.0),
                child: Text("CART", style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700
                ),)),
            Expanded(child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index){
                return Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(5.0),
                        elevation: 3.0,
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 80,
                                child: Image.asset(AssetsConst.BG_FOOD_IMG),
                              ),
                              SizedBox(width: 10.0,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Item - 1', style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(height: 20.0,),
                                    Text("\$ 50", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 15,
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.pinkAccent,
                          child: Icon(Icons.clear, color: Colors.white,),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                );
              },

            ),),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Subtotal      \$50", style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16.0
                  ),),
                  SizedBox(height: 5.0,),
                  Text("Delivery       \$05", style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16.0
                  ),),
                  SizedBox(height: 10.0,),
                  Text("Cart Subtotal     \$55", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  SizedBox(height: 20.0,),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      height: 50.0,
                      color: Colors.pinkAccent,
                      child: Text("Secure Checkout".toUpperCase(), style: TextStyle(
                          color: Colors.white
                      ),),
                      onPressed: (){},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}