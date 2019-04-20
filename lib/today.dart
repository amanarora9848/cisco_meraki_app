import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


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


//  TargetPlatform _platform;
//  VideoPlayerController _videoPlayerController1;
//  VideoPlayerController _videoPlayerController2;
//  ChewieController _chewieController;

//  @override
//  void initState(){
//    super.initState();
////    getJoke();
//    _videoPlayerController1 = VideoPlayerController.network(
//        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
//    _chewieController = ChewieController(
//        videoPlayerController: _videoPlayerController1,
//        aspectRatio: 3 / 2,
//        autoPlay: true,
//        looping: false,
//    );
//  }
//
//  @override
//  void dispose() {
//    _videoPlayerController1.dispose();
//    _videoPlayerController2.dispose();
//    _chewieController.dispose();
//    super.dispose();
//  }


  final String url = "https://f990b6dd.ngrok.io/zones";
  List merakiData;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<List> getJsonData() async {
    var response = await http.get(
      //We encode the URL here:
        Uri.encodeFull(url),
        //Only accept json response.
        headers: {"Accept": "application/json", "Content-type": "application/ json"}
    );
    print(response.body);
    var zone1 = json.decode(response.body)[0]['person'];
    var zone2 = json.decode(response.body)[1]['person'];
    List zone = [zone1, zone2];
    return zone;
  }



  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
      body: Container(
        child: FutureBuilder(
            future: getJsonData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.data == null){
                return Container(
                  child: new Center(
                    child: new CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 4.0,
                    ),
                  ),
                );
              }
              else {
                int greater;
//                String exc;
                if(snapshot.data[0] > snapshot.data[1]) {
                  greater = 2;
                }
                else if(snapshot.data[0] < snapshot.data[0]) {
                  greater = 1;
                }
//                else{
//                  exc = "Join any queue.";
//                }
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: pageHeight / 1.05,
                    width: pageWidth / 1.05,
                    child: new Column(
                      children: <Widget>[
                        Card(
                          elevation: 8.0,
                          child: new Container(
                            width: pageWidth / 1.05,
                            height: pageHeight / 3.2,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Persons in Queue 1:',
                                  style: new TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '${snapshot.data[0]}',
                                    style: new TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 40.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8.0,
                          child: new Container(
                            width: pageWidth / 1.05,
                            height: pageHeight / 3.2,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Persons in Queue 2:',
                                  style: new TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    '${snapshot.data[1]}',
                                    style: new TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 40.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8.0,
                          child: new Container(
                            width: pageWidth / 1.05,
                            height: pageHeight / 6.5,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Recommended Queue:',
                                  style: new TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.0,
                                  ),
                                ),
                                Text(
                                  '$greater',
                                  style: new TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
        ),
      ),
    );
  }
}
//
//class People{
//  final int person;
//  People(int, this.person);
//}
