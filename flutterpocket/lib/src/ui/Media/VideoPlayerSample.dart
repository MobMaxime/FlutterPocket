import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class VideoPlayerSample extends StatefulWidget{
  VideoPlayerSample(this.title);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return VideoPlayScreen();
  }
}
class VideoPlayScreen extends State<VideoPlayerSample>{
  VideoPlayerController _controller;
  Future<void> initializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    
    initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BgColor),
      appBar: AppBar(
        backgroundColor: Color(Constants.ThemeColor),
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: initializeVideoPlayerFuture,
          builder: (context , snapshot){
              if(snapshot.connectionState==ConnectionState.done)
              {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              }
              else
              {
                return Center(child: CircularProgressIndicator());
              }
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(_controller.value.isPlaying)
            _controller.pause();
            else
              _controller.play();
          });
        },
        backgroundColor: Color(Constants.ThemeColor),
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}