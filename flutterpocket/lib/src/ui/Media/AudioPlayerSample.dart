import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutterpocket/src/utils/constants.dart';
class AudioPlayerSample extends StatefulWidget {
  AudioPlayerSample(this.title);
  final String title;
  @override
  AudioExample createState() => AudioExample();
}

class AudioExample extends State<AudioPlayerSample> {
  AudioCache audioPlayer;
  AudioPlayer player;
  bool isPlay = true;
  // static AudioCache player = AudioCache();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAudio();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    // audioPlayer.clear('sample_audio.mp3');
    player =null;
    // AudioCache().clearCache();
    super.dispose();
  }
  Future loadAudio() async{
    player = await AudioCache().play('sample_audio.mp3');
    isPlay = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.BgColor),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(Constants.ThemeColor),
      ),
      body: Container(
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // player.load('assets/sample_audio.mp3');
          setState(() {
            if(isPlay)
            {
              player?.pause();
              isPlay = false;
            }
            else{
                player?.resume();
                isPlay = true;
            }
          });
          // audioPlayer.clear('sample_audio.mp3');
        },
        backgroundColor: Color(Constants.ThemeColor),
        child: Icon(isPlay ? Icons.pause : Icons.play_arrow),
    )
    );
  }
}