import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/model/bean/dummy/dummy_data_bean.dart';

class GameList extends StatelessWidget {
  final List<DummyDataBean> gameList;
  final bool showTitle;
  final double height;
  final double width;

  GameList({this.height,this.width,this.showTitle,this.gameList});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gameList.map((game) {
          return Container(
            //height: this.height,
            // width: this.width * .5,
            padding: EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: this.width * .45,
                  height: this.height * .75 ,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(game.url),fit: BoxFit.cover)
                  ),
                ),
                showTitle ? Text(game.title,
                  maxLines: 2,
                  style: TextStyle(color: Colors.white,fontSize: 16.0,),
                ):Container()
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}