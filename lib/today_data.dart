import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnaToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: AnaTodayPage(),
    );
  }
}

class AnaTodayPage extends StatefulWidget {
  @override
  _AnaTodayPageState createState() => _AnaTodayPageState();
}

class _AnaTodayPageState extends State<AnaTodayPage> {

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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 8.0),
        children: <Widget>[
          //myItemsStream(Icons.graphic_eq, 'Video Stream', 0xffed622b),
          myItems(Icons.graphic_eq, 'Should you visit', 0xff26cb3c),
          myItems(Icons.graphic_eq, 'Avg(people)', 0xffff3266),
          myItems(Icons.graphic_eq, 'Data Visuals', 0xff3399fe),
        ],
        staggeredTiles: [
          //StaggeredTile.extent(2, 250.0),
          StaggeredTile.extent(1, 290.0),
          StaggeredTile.extent(1, 290.0),
          StaggeredTile.extent(2, 460.0),
        ],
      ),
    );
  }
}

