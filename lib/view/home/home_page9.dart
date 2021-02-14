import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';

class HomePage9 extends StatefulWidget {
  @override
  _HomePage9State createState() => _HomePage9State();
}

class _HomePage9State extends State<HomePage9>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome,",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey[600]),),
                        Text(StringConst.WEBADDICTED,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.grey[700]),)
                      ],
                    ),
                    Icon(Icons.menu)
                  ],
                ),
              ),
              SizedBox(height:40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItemMenu(categories[3].icon, categories[3].title),
                  buildItemMenu(categories[4].icon, categories[4].title),
                ],),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItemMenu(categories[6].icon, categories[6].title),
                  buildItemMenu(categories[7].icon, categories[7].title),
                ],),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildItemMenu(categories[10].icon, categories[10].title),
                  buildItemMenu(categories[13].icon, categories[13].title),
                ],),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Current orders (3)",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.grey[700]),),
                    Text("View all",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.blue),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 8,right: 8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(0,1)
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0,1),
                                blurRadius: 1
                            )
                          ]
                      ),
                      child: ClipRRect(
                        child: Icon(Icons.delivery_dining,),
                        borderRadius: BorderRadius.circular(20),

                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order No : #456322121566",style: TextStyle(fontWeight: FontWeight.w500),),
                        Text("Out of delivery",style: TextStyle(color: Colors.blue),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemMenu(IconData image,String text) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)
        {}
        ));
      },
      child: Container(
        height: 140,
        width: 165,
        decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRect(child: Icon(image)),//Image.asset(image,width: 100,height: 80,fit: BoxFit.fill,)),
            SizedBox(height: 15,),
            Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),
          ],
        ),
      ),
    );
  }
}
