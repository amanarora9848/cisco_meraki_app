import 'package:flutter/material.dart';
import 'today.dart';
import 'tomorrow.dart';
import 'weekly.dart';

class TabTheme extends StatefulWidget {
//  var cameras;
//  TabTheme(this.cameras);

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
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 3);
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
              text: "TODAY",
            ),
            new Tab(
              text: "TOMORROW",
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