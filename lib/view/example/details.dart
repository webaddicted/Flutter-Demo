import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:flutterbeginner/view/example/video_player.dart';
//import 'package:flutterbeginner/view/example/video_player.dart';
//import 'package:flutterbeginner/view/example/video_player_screen.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Builder(
        builder: (context) =>
        new SliverFab(
          floatingWidget: FloatingActionButton(
            onPressed: () =>{
            navigationPush(context, VideoPlayerScreen(
              controller: YoutubePlayerController(
                initialVideoId: 'Qu9kmSQwfZw',
                flags: YoutubePlayerFlags(
                  autoPlay: true,
//                  mute: true,
                ),
              ),
            ))
              ,
            },
//
            child: Icon(Icons.add),
          ),
          floatingPosition: FloatingPosition(right: 16),
          expandedHeight: 256.0,
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 256.0,
              pinned: true,
              flexibleSpace: new FlexibleSpaceBar(
                title: new Text("SliverFab Example"),
                background: new Image.network(
                  ApiConstant.DEMO_IMG,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(
                new List.generate(
                  30,
                      (int index) =>
                  new ListTile(title: new Text("Item $index")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


