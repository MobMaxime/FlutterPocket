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
  AudioPlayer audioPlayer;
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
    audioPlayer =null;
    super.dispose();
  }
  Future loadAudio() async{
    audioPlayer = await AudioCache().loop("sample_audio.mp3");
    // player.play('assets/sample_audio.mp3');
    // audioPlayer = AudioPlayer();
    // AudioPlayer.logEnabled = true;
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
        },
        backgroundColor: Color(Constants.ThemeColor),
        child: Icon(Icons.play_arrow),
    )
    );
  }
}