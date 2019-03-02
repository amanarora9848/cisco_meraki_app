import 'package:flutter/material.dart';
import 'today.dart';
import 'tomorrow.dart';
import 'weekly.dart';
import 'today_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TabTheme extends StatefulWidget {
//  var cameras;
//  TabTheme(this.cameras);

  @override
  _TabThemeState createState() => new _TabThemeState();
}

class _TabThemeState extends State<TabTheme>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

//  Future getJoke() async {
//    http.Response responseJoke = await http.get('http://api.icndb.com/jokes/random/5');
//    var resp = jsonDecode(responseJoke.body).value[2].id;
//    debugPrint(resp);
//  }
//  final String url = 'http://api.icndb.com/jokes/random/5';
//  List data;
//  Future<String> getData() async {
//    var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
//
//    setState(() {
//      var resBody = json.decode(res.body);
//      data = resBody["value"];
//    });
//
//    return "Success fetting the json!";
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green[600],
        title: new Text("Queue Data Analytics", style: TextStyle(
            letterSpacing: 3.0,
            wordSpacing: 2.0,
          ),
        ),
        elevation: 0.0,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            //new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(
              //text: "STREAM",
              icon: new Icon(Icons.ondemand_video),
            ),
            new Tab(
              text: "TODAY",
            ),
            new Tab(
              text: "'MORROW",
            ),
            new Tab(
              text: "WEEKLY",
            ),
          ],
        ),
//        actions: <Widget>[
//          new Icon(Icons.search),
//          new Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 5.0),
//          ),
//          new Icon(Icons.more_vert)
//        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Today(),
          new AnaToday(),
          new Tomorrow(),
          new Weekly(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.green[600],
        child: new Icon(
          Icons.note_add,
        ),
//        onPressed: print('Book on google calendar api'),
      ),
    );
  }
}