import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Weekly extends StatelessWidget {

  Material myItems (IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 10.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(20.0),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(4.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Text(heading,
                        style: new TextStyle(
                          color: new Color(color),
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(6.0),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
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
        crossAxisCount: 1,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 8.0),
        children: <Widget>[
          myItems(Icons.graphic_eq, 'Data for the next 10 days.', 0xffed622b),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 700.0),
        ],
      ),
    );
  }
}
