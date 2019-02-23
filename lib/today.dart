import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

  Future getJoke() async {
    http.Response responseJoke = await http.get('http://api.icndb.com/jokes/random/5');
    var resp = jsonDecode(responseJoke.body).value[2].id;
    debugPrint(resp);
  }

  @override
  void initState(){
    super.initState();
    getJoke();
 }

  Material myItems (IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 12.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(14.0),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(heading,
                        style: new TextStyle(
                          color: new Color(color),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myItemsStream (IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 8.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(0.0),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(heading,
                        style: new TextStyle(
                          color: new Color(color),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 8.0),
        children: <Widget>[
          myItemsStream(Icons.graphic_eq, 'Video Stream', 0xffed622b),
          myItems(Icons.graphic_eq, 'Should you visit', 0xff26cb3c),
          myItems(Icons.graphic_eq, 'Avg(people)', 0xffff3266),
          myItems(Icons.graphic_eq, 'Data Visuals', 0xff3399fe),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 250.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 260.0),
        ],
      ),
    );
  }
}