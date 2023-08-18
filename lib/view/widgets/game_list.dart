import 'package:flutter/material.dart';
import 'package:flutterbeginner/model/bean/dummy/dummy_data_bean.dart';

class GameList extends StatelessWidget {
  final List<DummyDataBean> gameList;
  final bool showTitle;
  final double height;
  final double width;

  const GameList({required this.height,required this.width,required this.showTitle,required this.gameList});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gameList.map((game) {
          return Container(
            //height: this.height,
            // width: this.width * .5,
            padding: const EdgeInsets.only(left:10,right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 180,
                  height: 120 ,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(game.url),fit: BoxFit.cover)
                  ),
                ),
                showTitle ? Text(game.title,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.black,fontSize: 16.0,),
                ):Container()
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}