import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: TodayPage(),
    );
  }
}


class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {


  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState(){
    super.initState();
//    getJoke();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    var pgWidth  = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.video_label,
                        size: 26.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Video Stream',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
               Chewie(
                 controller: _chewieController,
               ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Container(
                    width: pgWidth.toDouble() - 20,
                    child: Text(
                        "This is the live video stream from Cisco Meraki camera, from the place you want to visit. You can have a look at the queue. Information and analytics has been provided on the tabs.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  ],
                  ),
                ),
              ],
            ),
          ],
        )
    );

  }
}