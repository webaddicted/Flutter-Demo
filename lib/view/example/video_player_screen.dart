import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  String videoUrl;
  File videoFile;

  VideoPlayerScreen(this.videoUrl, this.videoFile);

  @override
  _VideoPlayerScreenState createState() =>
      _VideoPlayerScreenState(videoUrl, videoFile);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  BuildContext ctx;
  String videoUrl;
  File videoFile;

  _VideoPlayerScreenState(this.videoUrl, this.videoFile);

  @override
  void initState() {
    super.initState();
    if (videoUrl != null) {
      _controller = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          setState(() {});
        });
    } else {
      _controller = VideoPlayerController.file(videoFile);
      _controller.addListener(() {
        setState(() {});
      });
      _controller.initialize().then((_) {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBarWithBackBtn(ctx:context, title:StringConst.VIDEO_PLAYER_TITLE),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
        body: Builder(
          builder: (context) => _createUi(context),
        ));
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
//    _controller.play();
    return Stack(
      children: <Widget>[
        Container(color: Colors.black),
        Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
