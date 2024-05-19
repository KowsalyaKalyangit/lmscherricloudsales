import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';

class AudioRecorderIosPage extends StatefulWidget {
  const AudioRecorderIosPage({super.key});

  @override
  State<AudioRecorderIosPage> createState() => _AudioRecorderIosPageState();
}

class _AudioRecorderIosPageState extends State<AudioRecorderIosPage> {
 AudioPlayer audioPlayer = AudioPlayer();
  String audioUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
  PlayerState playerState = PlayerState.stopped;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        playerState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: playerState == PlayerState.playing ? Text('Pause') : Text('Play'),
              onPressed: () {
                if (playerState == PlayerState.playing) {
                  audioPlayer.pause();
                } else {
                  audioPlayer.play(UrlSource(audioUrl));
                }
              },
            ),
            SizedBox(height: 20),
            Text('Player State: $playerState'),
          ],
        ),
      ),
    );
  }
}