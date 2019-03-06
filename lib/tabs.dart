import 'package:flutter/material.dart';
import 'today.dart';
import 'tomorrow.dart';
import 'weekly.dart';
import 'today_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import 'package:device_calendar/device_calendar.dart';


class TabTheme extends StatefulWidget {

  @override
  _TabThemeState createState() => new _TabThemeState();
}

class _TabThemeState extends State<TabTheme>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

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
        centerTitle: true,
        backgroundColor: Colors.green[600],
        title: new Text("Cisco Meraki View", style: TextStyle(
            letterSpacing: 3.3,
            wordSpacing: 2.0,
          ),
        ),
        elevation: 3.0,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            //new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(
              //text: "STREAM",
              text: "QUEUE",
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
        //TODO: onPressed: print('Book on google calendar api'),
      ),
    );
  }
}