import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/model/repo/dummy_data.dart';
import 'package:flutterbeginner/view/widgets/game_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage7 extends StatefulWidget {
  @override
  _HomePage7State createState() => _HomePage7State();
}

class _HomePage7State extends State<HomePage7>{
  Size size;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex=0;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Stack(children: [
        _featuredGames(),
        _backgroundBox(),
        _topLayer(),
      ],),
    );
  }

  Widget _featuredGames() {
    return SizedBox(
      height: 350,
      child: PageView(
        onPageChanged: (int index){
          setState(() {
            _selectedIndex=index;
          });
        },
        scrollDirection: Axis.horizontal,
        children: dummyGameData1.map((game) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(game.url), fit: BoxFit.cover,)
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _backgroundBox(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size.width,
        height: size.height * .80,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1.0),
                  Colors.transparent
                ],
                stops: [.60,1.0],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
            )
        ),
      ),
    );
  }

  Widget _topLayer(){
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _appBarWidget(),
          SizedBox(height: size.height * .20,),
          _featuredGameInfoWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,),
            child: GameList(height: size.height * .22,width: size.width,gameList:dummyGameData2,showTitle: true,),
          ),
          _featuredGameBanner(),
          Expanded(child: GameList(width: size.width,height: size.height * .20,gameList: dummyGameData1,showTitle: true,)),
        ],
    );
  }

  Widget _appBarWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*SvgPicture.asset(
            'assets/icons/menu.svg',
            matchTextDirection: false,
            color: Colors.white,
          width: 25,
          height: 25,
        ),*/
        Icon(Icons.menu,size: 25,color: Colors.white,),
        Row(
          children: [
            Icon(Icons.search,size: 25,color: Colors.white,),
            SizedBox(width: size.width * .05,),
            Icon(Icons.notifications_none,size: 25,color: Colors.white,),
          ],
        )
      ],
    );
  }

  Widget _featuredGameInfoWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        getTxtWhiteColor(msg:dummyGameData1[_selectedIndex].title,maxLines: 1,fontSize: 30,fontWeight: FontWeight.bold),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: dummyGameData1.map((game) {
            int currentIndex=dummyGameData1.indexOf(game);
            return Container(
              margin: EdgeInsets.only(right: 2),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: currentIndex ==_selectedIndex ? Colors.green : Colors.yellow,
                  borderRadius: BorderRadius.circular(100)
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _featuredGameBanner(){
    return Container(
      height: size.height * .13,
      width: size.width,
      margin: EdgeInsets.only(bottom: 8,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image: NetworkImage(dummyGameData1[3].url),fit: BoxFit.cover,)
      ),
    );
  }
}

