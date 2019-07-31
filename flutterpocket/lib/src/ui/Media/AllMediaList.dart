import 'package:flutter/material.dart';
import 'package:flutterpocket/src/ui/Media/AudioPlayerSample.dart';
import 'package:flutterpocket/src/ui/Media/CameraExample.dart';
import 'package:flutterpocket/src/ui/Media/VideoPlayerSample.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class AllMediaList extends StatelessWidget {
  final style = TextStyle(color: Color(Constants.FontColor),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Example'),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
        color: Color(Constants.BgColor),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('Video Player',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new VideoPlayerSample('Video Player')));
              },
            ),),
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('Audio Player',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new AudioPlayerSample('Audio Player')));
              },
            ),),
            Card(color: Color(Constants.ThemeColor),
              child: ListTile(
              title: Text('Capture Image',style: style,),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => new CameraExample('Capture Image')));
              },
            ),),
          ],
        ),
      ),
    );
  }
}